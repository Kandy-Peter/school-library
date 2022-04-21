require_relative './person'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: false)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  belongs_to :classroom

  def play_hooky
    "¯\(ツ)/¯"
  end
end
