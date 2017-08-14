class Teacher < ApplicationRecord
  belongs_to :user, optional: true

  has_one :advisory_block, class_name: "Block", dependent: :nullify

  has_many :specialization, dependent: :nullify
  has_many :subjects, through: :specialization, dependent: :nullify

  has_many :teaching_assignments, class_name: "SubjectAssignment", dependent: :nullify
  
end
