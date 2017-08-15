class Student < ApplicationRecord
  after_create :associate_block
  belongs_to :user, optional: true

  has_one  :block_assignment
  has_many :blocks, through: :block_assignment

  has_many   :subjects, through: :blocks

  def student_name 
    "#{self.user.first_name} #{self.user.last_name}"
  end

  private
  def associate_block
    default_block = Block.create_with(year_level: 0).find_or_create_by(name:"Default")
    self.blocks << default_block
  end
end
