# file: movies_directory_recipe.md
Single Table Design Recipe Template for Movies_directory


1. Extract nouns from the user stories or specification


As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' titles.


As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' genres.


As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' release year.

: movies, titles, genres, release-year

2. Infer the Table Name and Columns
Record Properties
: movie title, genre, release_year

Table name: movies

Column names: title, genre, release_year

3. Decide the column types.

id: SERIAL
title: text
genre: text
release_year: integer

4. Write the SQL.

-- file: movies_table.sql

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  genre TEXT NOT NULL,
  release_year INTEGER NOT NULL
);

5. Create the table.
psql -h 127.0.0.1 movies_directory < movies_table.sql

6. verify the work by inserting a new movie record and listing the records using SQL queries:

--insert a new movie record

INSERT INTO movies(title, genre, release_year) VALUES ('The Good Doctor', 'Drama', 1999);

--list the movie records

SELECT * FROM movies;