CREATE TABLE public.producers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(128) NOT NULL,
  nationality VARCHAR(64),
  birthYear INTEGER
);

CREATE TABLE public.movies (
  title VARCHAR(128),
  year INTEGER,
  length INTEGER,
  producerId INTEGER,
  directorName VARCHAR(128),
  PRIMARY KEY(title, year),
  FOREIGN KEY(producerId) REFERENCES producers(id)
);

CREATE TABLE public.actors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(128) NOT NULL,
  birthYear INTEGER,
  nationality VARCHAR(64)
);

CREATE TABLE public.actedIn (
  movieTitle VARCHAR(128) NOT NULL,
  movieYear INTEGER NOT NULL,
  actorId INTEGER NOT NULL,
  PRIMARY KEY(movieTitle, movieYear, actorId),
  FOREIGN KEY(movieTitle, movieYear) REFERENCES movies(title, year),
  FOREIGN KEY(actorId) REFERENCES actors(id)
);

CREATE TABLE public.users(
  username CHARACTER VARYING(64) PRIMARY KEY,
  name CHARACTER VARYING(64) NOT NULL,
  password CHARACTER VARYING(256) NOT NULL,
  admin BOOLEAN DEFAULT false,
  created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT current_timestamp
);