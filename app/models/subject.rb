class Subject
  attr_accessor :name, :code, :teachers

  def initialize
    @teachers = Array.new
  end
end
