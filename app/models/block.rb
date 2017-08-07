class Block < ApplicationRecord
  validates :name, :year_level, presence: true
  validates :name, uniqueness: { scope: :year_level }
  has_many :users

  def advisor
    self.users.with_role :teacher
  end

  def students
    self.users.with_role :student
  end

  def subjects 
    self.subjects.each do |subject|
    end
  end
end
