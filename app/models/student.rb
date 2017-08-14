class Student < ApplicationRecord
  belongs_to :user, optional: true
  has_one    :block_assignment
  has_one    :block, through: :block_assignment
  has_many   :subjects, through: :block
end
