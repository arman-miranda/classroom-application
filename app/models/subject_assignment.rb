class SubjectAssignment < ApplicationRecord
  belongs_to :subject
  belongs_to :block
  belongs_to :teacher, optional: true
end
