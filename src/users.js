import bcrypt from 'bcrypt';
import { query } from './db.js';

export async function comparePasswords(password, hash) {
  const result = await bcrypt.compare(password, hash);

  return result;
}

export async function findByUsername(username) {
  const q = 'SELECT * FROM users WHERE username = $1';

  try {
    const result = await query(q, [username]);

    if (result.rowCount === 1) {
      return result.rows[0];
    }
  } catch (e) {
    console.error('Gat ekki fundið notanda eftir notendnafni');
    return null;
  }

  return false;
}

export async function findByEmail(email) {
  const q = 'SELECT * FROM users WHERE email = $1';

  try {
    const result = await query(q, [email]);

    if (result.rowCount === 1) {
      return result.rows[0];
    }
  } catch (e) {
    console.error('Gat ekki fundið notanda eftir email');
  }

  return null;
}

export async function createUser(username, password) {
  // Geymum hashað password!
  const hashedPassword = await bcrypt.hash(password, 11);

  const q = `
    INSERT INTO
      users (username, password)
    VALUES ($1, $2)
    RETURNING *
  `;

  try {
    const result = await query(q, [username, hashedPassword]);
    return result.rows[0];
  } catch (e) {
    console.error('Gat ekki búið til notanda');
  }

  return null;
}