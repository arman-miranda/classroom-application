class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :birthdate, presence: true

  has_many :subjects_users
  has_many :subjects, through: :subjects_users
  has_many :blocks_users
  has_many :blocks, through: :blocks_users
  has_one  :advisory_block, class_name: "Block"

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
