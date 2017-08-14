class Subject < ApplicationRecord
  validates :name, presence: true
  has_many  :subject_assignments
  has_many  :blocks, through: :subject_assignments
  has_many  :students, through: :blocks

  has_many :specialization
  has_many :teachers, through: :specialization




  def assign_grade(user, final_grade)
    user = self.subjects_users.find_by_user_id(user)
    user.grade = final_grade
    user.save!
  end

end
