require_relative './modules/create_book'
require_relative './modules/create_person'
require_relative './modules/create_rental'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
    @people = CreatePerson.new(@people)
    @books = CreateBook.new(@books)
    @rentals = CreateRental.new({ rentals: @rentals, books: @books, people: @people })
  end

  def entry_point
    puts 'Welcome to School Library App!'

    until console_inputs
      answer = gets.chomp.to_i
      if answer == 7
        puts 'Thanks you for choosing this App'
        break
      end
      user_inputs answer
    end
  end

  def console_inputs
    puts
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person ID'
    puts '7 - Exit'
  end

  def user_inputs(answer)
    case answer
    when 1
      @books.list_all_books
    when 2
      @people.list_all_people
    when 3
      @people.create_person
    when 4
      @books.create_book
    when 5
      @rentals.create_rental
    when 6
      @rentals.list_all_rentals
    else
      puts 'Enter numbers between 1 and 7'
    end
  end
end
