class SubjectAssignment < ApplicationRecord
  belongs_to :subject
  belongs_to :block
  belongs_to :teacher, optional: true
  has_many :announcements
  has_many :lectures
  has_many :exam_schedules

  def teaching_load_name
    "#{self.subject.name}@#{self.block.complete_block_name}"
  end

end
