class SubjectAssignment < ApplicationRecord
  belongs_to :subject, dependent: :destroy
  belongs_to :block, dependent: :destroy
  belongs_to :teacher, optional: true

  def teaching_load_name
    "#{self.subject.name}@#{self.block.complete_block_name}"
  end
end
