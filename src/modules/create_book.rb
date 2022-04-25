require_relative '../book'

class CreateBook
	attr_accessor :books

	def initialize(books)
		@books = books
	end

	def list_all_books
    puts 'Database is empty! Add a book.' if @books.empty?
    @books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

	def create_book()
    puts 'Create a new book'
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets
    @books.push(Book.new(title, author))
    puts "Book #{title} created successfully."
  end
end