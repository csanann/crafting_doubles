-- file: spec/seeds_book_store_test.sql

TRUNCATE TABLE books RESTART IDENTITY; 


INSERT INTO books (title, author_name) VALUES ('Nineteen Eighty-Four', 'George Orwell'),
INSERT INTO books (title, author_name) VALUES ('Mrs Dalloway', 'Virginia Woolf');