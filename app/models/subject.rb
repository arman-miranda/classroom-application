class Subject < ApplicationRecord
  validates :name, presence: true
  has_many  :subject_assignments, dependent: :nullify
  has_many  :blocks, through: :subject_assignments
  has_many  :students, through: :blocks

  has_many :specialization
  has_many :teachers, through: :specialization

  has_many :subject_grades

  def search_teacher(block)
    searched = self.subject_assignments.find_by_block_id(block).teacher

    if searched.nil?
      "No teacher assigned yet!"
    else
      searched.teacher_name
    end
  end
end
