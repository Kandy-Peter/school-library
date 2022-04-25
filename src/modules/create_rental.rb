require_relative '../rentals'

class CreateRental
  attr_accessor :people, :books, :rentals

  def initialize(rental)
    @people = rental[:people]
    @rentals = rental[:rentals]
    @books = rental[:books]
  end

  def create_rental
    puts 'Select which book you want to rent by entering its number'
    [@books].each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i

    puts 'Select a person from the list by its number'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    @rentals.push(Rental.new(date, @books[book_id], @people[person_id]))
    puts 'Rental created successfully'
  end

  def list_all_rentals
    puts 'To see person rentals enter the person ID: '
    [@people].each do |person|
      puts "id: #{person.id}"
    end
    id = gets.chomp.to_i
    puts 'Rented Books:'
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Peson: #{rental.person.name}  Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      else
        puts
        puts 'No records where found for the given ID'
      end
    end
  end
end