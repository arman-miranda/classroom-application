class Block < ApplicationRecord
  validates :name, :year_level, presence: true
  validates :name, uniqueness: { scope: :year_level }
  has_many :users
  has_many :blocks_subjects
  has_many :subjects, through: :blocks_subjects

  def advisor
    self.users.with_role :teacher
  end

  def students
    self.users.with_role :student
  end

end
