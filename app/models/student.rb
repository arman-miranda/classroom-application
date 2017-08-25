class Student < ApplicationRecord
  after_create :generate_student_no
  belongs_to :user, optional: true

  has_one  :block_assignment, dependent: :nullify
  has_many :blocks, through: :block_assignment, dependent: :nullify

  has_many   :subjects, through: :blocks

  has_many   :subject_grades, dependent: :destroy

  def student_name 
    "#{self.user.first_name} #{self.user.last_name}"
  end

  
  def generate_student_no
    current_known_batch = Student.all.group_by { |y| y.created_at.year }
    order_of_enrollment = current_known_batch[Date.today.year].find_index(self)

    self.update_attribute(:student_no, "#{Date.today.year}#{order_of_enrollment.to_s.rjust(6, '0')}")
  end

end
