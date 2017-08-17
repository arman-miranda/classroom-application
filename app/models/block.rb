class Block < ApplicationRecord
  validates :name, :year_level, presence: true
  validates :name, uniqueness: { scope: :year_level }
  validates :advisory_teacher, uniqueness: true, allow_nil: true

  has_many :block_assignments, dependent: :destroy
  has_many :students, through: :block_assignments
  
  has_many :subject_assignments, dependent: :nullify
  has_many :subjects, through: :subject_assignments, dependent: :nullify

  belongs_to :advisory_teacher, class_name: "Teacher", foreign_key: "teacher_id", optional: true
  accepts_nested_attributes_for :advisory_teacher


  def teachers
    self.users.with_role :teacher
  end

  def complete_block_name
    "#{self.year_level}-#{self.name}"
  end

end
