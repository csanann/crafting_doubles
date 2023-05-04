# file: book_store_recipe.md
BookStore Model and Repository Classes Design Recipe

1. Design and create the Table
DB: bookstore
lib / -book.rb, -book_repository.rb, -database_connection.rb
spec/ -book_repository_spec.rb, -spec_helper.rb, seeds/ -book_store.sql, -seeds_book_store_test.sql
app.rb
book_store_recipe.md

Since the table is already created in the database, so we'll skip this step.

Table: books

Columns:
id | title | author_name

2. Create Test SQL seeds

-- file: spec/seeds_book_store.sql


TRUNCATE TABLE books RESTART IDENTITY; 


INSERT INTO books (title, author_name) VALUES ('Nineteen Eighty-Four', 'George Orwell');
INSERT INTO books (title, author_name) VALUES ('Mrs Dalloway', 'Virginia Woolf');
INSERT INTO books (title, author_name) VALUES ('Emma', 'Jane Austen');
INSERT INTO books (title, author_name) VALUES ('Dracula', 'Bram Stoker');
INSERT INTO books (title, author_name) VALUES ('The Age of Innocence', 'Edith Wharton');


> psql -h 127.0.0.1 book_store < seeds_book_store.sql

3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.


# Table name: books

# Model class
# (in lib/book.rb)
class Books
end

# Repository class
# (in lib/book_repository.rb)
class BooksRepository
end

4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# EXAMPLE
# Table name: books

# Model class
# (in lib/book.rb)

class Book

  # Replace the attributes by your own columns.
  attr_accessor :id, :title, :author_name
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# book = Book.new
# student.name = 'Jo'
# student.name
You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.

5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

# EXAMPLE
# Table name: books

# Repository class
# (in lib/book_repository.rb)

class BooksRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM books;

    # Returns an array of Book objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students WHERE id = $1;

    # Returns a single Student object.
  end

  # Add more methods below for each operation you'd like to implement.

  # def create(student)
  # end

  # def update(student)
  # end

  # def delete(student)
  # end
end
6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get all books

repo = BookRepository.new

books = repo.all

books.length # =>  2

books[0].id # =>  1
books[0].name # =>  'TestBook1'
books[0].author_name # =>  'TestAuthor1'
# 2
# Get a single student

repo = StudentRepository.new

student = repo.find(1)

student.id # =>  1
student.name # =>  'David'
student.cohort_name # =>  'April 2022'

# Add more examples for each method
Encode this example as a test.

7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/book_repository_spec.rb

def reset_books_table
  seed_sql = File.read('spec/seeds_books.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'books' })
  connection.exec(seed_sql)
end

describe BooksRepository do
  before(:each) do 
    reset_books_table
  end

  # (your tests will go here).
end
8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.