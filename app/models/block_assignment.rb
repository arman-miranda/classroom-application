class BlockAssignment < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :teacher, optional: true
  belongs_to :block,   optional: true
end
