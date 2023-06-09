# file: lib/book_repository.rb)

require 'book'
require 'database_connection'

class BooksRepository
    def all
      sql = 'SELECT id, title, author_name FROM books;'
      result_set = DatabaseConnection.exec_params(sql, [])

      books = []
      result_set.each do |record|
        book = Books.new
        book.id = record['id']
        book.title = record['title']
        book.author_name = record['author_name']
        
        books << book
      end
      return books
    end
end