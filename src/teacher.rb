require_relative './person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission: false)
    super
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
