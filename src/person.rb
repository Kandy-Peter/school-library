require_relative './decorate'
require_relative './rentals'

class Person < Decorator
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name, parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    is_of_age || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, person)
    @rentals << Rental.new(date, person, self)
  end
end
