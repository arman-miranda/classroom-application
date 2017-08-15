class User < ApplicationRecord
  rolify after_add: :create_resource, before_remove: :destroy_resource
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :birthdate, presence: true

  has_one :teacher, dependent: :destroy
  has_one :student, dependent: :destroy


  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def assign(block)
    self.blocks << block
  end

  def subject_grades
    grade_list = Hash.new

    self.subjects.each do |subject|
      grade_list[subject.name] = self.subjects_users.find_by_subject_id(subject).grade
    end

    grade_list
  end

  private

  def create_resource(role)
    if self.has_role? :teacher
      Teacher.create(user:self)
    elsif self.has_role? :student
      Student.create(user:self)
    end
  end

  def destroy_resource(role)
    if Teacher.exists?(user:self)
      Teacher.where(user:self).destroy_all
    elsif Student.exists?(user:self)
      Student.where(user:self).destroy_all
    end
  end

end
