class SubjectAssignment < ApplicationRecord
  belongs_to :subject
  belongs_to :block
  belongs_to :teacher, optional: true

  def teaching_load_name
    "#{self.subject.name} #{self.block.name}"
  end
end
