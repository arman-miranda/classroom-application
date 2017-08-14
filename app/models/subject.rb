class Subject < ApplicationRecord
  validates :name, presence: true
  has_many  :subject_assignments
  has_many  :blocks, through: :subject_assignments
  has_many  :students, through: :blocks

  has_many :specialization
  has_many :teachers, through: :specialization

end
