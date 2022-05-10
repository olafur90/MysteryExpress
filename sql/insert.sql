INSERT INTO public.producers
  (name, nationality, birthYear)
VALUES
  ('Þorsteinn Magnússon', 'Iceland', 1983),
  ('Quentin Tarantino', 'United States', 1963),
  ('Baltasar Kormákur', 'Iceland', 1966);

INSERT INTO movies
  (title, year, length, producerId, directorName)
VALUES
  ('Kill Bill', 2003, 111, (SELECT id FROM producers WHERE name='Quentin Tarantino'), 'Quentin Tarantino'),
  ('101 Reykjavík', 2000, 88, (SELECT id FROM producers WHERE name='Baltasar Kormákur'), 'Baltasar Kormákur');

INSERT INTO actors
  (name, birthYear, nationality)
VALUES
  ('Uma Thurman', 1970, 'United States'),
  ('Michael Madsen', 1957, 'United States'),
  ('Lucy Liu', 1968, 'United States'),
  ('Hilmir Snær Guðnason', 1969, 'Iceland'),
  ('Ólafur Darri Ólafsson', 1973, 'Iceland');

INSERT INTO actedIn
  (movieTitle, movieYear, actorId)
VALUES
  ('Kill Bill', 2003, (SELECT id FROM actors WHERE name='Uma Thurman')),
  ('Kill Bill', 2003, (SELECT id FROM actors WHERE name='Michael Madsen')),
  ('Kill Bill', 2003, (SELECT id FROM actors WHERE name='Lucy Liu')),
  ('101 Reykjavík', 2000, (SELECT id FROM actors WHERE name='Hilmir Snær Guðnason')),
  ('101 Reykjavík', 2000, (SELECT id FROM actors WHERE name='Ólafur Darri Ólafsson'));

INSERT INTO users (username, name, password, admin) VALUES ('oliEmail@email.com', 'Óli admin', '$2a$11$pgj3.zySyFOvIQEpD7W6Aund1Tw.BFarXxgLJxLbrzIv/4Nteisii', true);
INSERT INTO users (username, name, password, admin) VALUES ('olafur1990@gmail.com', 'Ólafur Pálsson', '$2a$04$XUiDW4pV1n2pt3HTzFAbXu1zkxADMiIw4NzsnSKOYK8.iEj9Mgciy', true);