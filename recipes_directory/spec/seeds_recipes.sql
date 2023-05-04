-- file: spec/seeds_recipes.sql

TRUNCATE TABLE recipes RESTART IDENTITY;

INSERT INTO recipes (name, average_cooking_time, rating) VALUES ('Spaghetti Bolognese', 45, 4);
INSERT INTO recipes (name, average_cooking_time, rating) VALUES ('Tocos', 30, 5);
