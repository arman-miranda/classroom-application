class Subject < ApplicationRecord
  validates :name, presence: true

  has_many :subjects_users
  has_many :blocks_subjects
  has_many :users, through: :subjects_users
  has_many :blocks, through: :blocks_subjects

  def teachers
    self.users.with_role :teacher
  end

  def students
    self.users.with_role :student
  end

  def assign_grade(user, final_grade)
    user = self.subjects_users.find_by_user_id(user)
    user.grade = final_grade
    user.save!
  end

end
