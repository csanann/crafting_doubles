-- file: movies_table.sql

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(250) NOT NULL,
  genre VARCHAR(100) NOT NULL,
  release_year INTEGER
);

INSERT INTO movies (title, genre, release_year) VALUES
    ('The Good Doctor', 'Drama', 1999),
    ('The Godfather', 'Crime', 1972),
    ('Mario', 'Animation', 2023);