#file: spec/book_repository_spec.rb


require 'spec_helper'
require 'book_repository'

RSpec.describe BooksRepository do
    before(:all) do
        DatabaseConnection.connect({ host: '127.0.0.1', dbname: 'book_store' })
    end

    it "returns the list of boooks" do 
        repo = BooksRepository.new
        books = repo.all

        expect(books.length).to eq (5)

        expect(books.first.id).to eq "1"
        expect(books.first.title).to eq ('Nineteen Eighty-Four')
        expect(books.first.author_name).to eq ('George Orwell')
    end
end