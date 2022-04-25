require_relative '../student'
require_relative '../teacher'

class CreatePerson
  attr_accessor :persons

  def initialize(people)
    @people = people
  end

  def list_all_people
    puts 'Database is empty! Add a person.' if @people.empty?
    @people.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, id: #{person.id}"
    end
  end

  def create_person
    print 'To create a student, press 1, to create a teacher, press 2 : '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input. Try again'
    end
  end

  def create_student
    puts 'Create a new student'
    print 'Enter student age: '
    age = gets.chomp.to_i
    print 'Enter name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'n'
      puts 'Student does not have parent permission, can not rent books'
    when 'y'
      new_student = Student.new(age, name, parent_permission: false)
      @people << new_student
      puts 'Student created successfully'
    end
  end

  def create_teacher
    puts 'Create a new teacher'
    print 'Enter teacher age: '
    age = gets.chomp.to_i
    print 'Enter teacher name: '
    name = gets.chomp
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    @people.push(Teacher.new(age, specialization, name))
    puts 'Teacher created successfully'
  end

end