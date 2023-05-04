#file: app.rb

require_relative 'lib/books_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect ({host: '127.0.0.1', dbname: 'book_store'})

repo = BooksRepository.new
books = repo.all

blook.each do |book|
    p book