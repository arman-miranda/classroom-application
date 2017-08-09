class Block < ApplicationRecord
  validates :name, :year_level, presence: true
  validates :name, uniqueness: { scope: :year_level }

  has_many :blocks_users
  has_many :users, through: :blocks_users

  has_many :blocks_subjects
  has_many :subjects, through: :blocks_subjects

  belongs_to :advisory_teacher, class_name: 'User', foreign_key: "user_id", optional: true

  def students
    self.users.with_role :student
  end

  def teachers
    self.users.with_role :teacher
  end

end
