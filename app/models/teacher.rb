class Teacher < ApplicationRecord
  belongs_to :user, optional: true

  has_one :advisory_block, class_name: "Block", dependent: :nullify
  accepts_nested_attributes_for :advisory_block
  

  has_many :specialization
  has_many :subjects, through: :specialization, dependent: :nullify

  has_many :teaching_assignments, class_name: "SubjectAssignment", dependent: :nullify
  
  def teacher_name
    "#{ self.user.first_name } #{ self.user.last_name }"
  end
end
