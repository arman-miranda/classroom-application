class Teacher < ApplicationRecord
  belongs_to :user, optional: true

  has_one :advisory_block, class_name: "Block"

  has_many :specialization
  has_many :subjects, through: :specialization

  has_many :teaching_assignments, class_name: "SubjectAssignment"
end
