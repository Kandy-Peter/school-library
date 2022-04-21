require_relative './student'

class Classroom
  def initialize(label)
    @label = label
  end

  has_many :students
  
  attr_accessor :label
end