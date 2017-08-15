require 'rails_helper'

RSpec.describe User, type: :model do
  
  let (:user)    { FactoryGirl.build(:user) }
  let (:admin1)   { FactoryGirl.build(:admin_role) }
  let (:teacher1) { FactoryGirl.build(:teacher_role) }
  let (:student1) { FactoryGirl.build(:student_role) }
  let (:subject1) { FactoryGirl.build(:subject) }
  let (:subject2) { FactoryGirl.build(:subject, name: "C Programming", 
                                       code: "CS102") }
  let (:subject3) { FactoryGirl.build(:subject, name: "Filipino 1", 
                                      code: "Fil 1") }
  let (:block1) { FactoryGirl.build(:block) }
  let (:block2) { FactoryGirl.build(:block) }

  it "has a valid factory" do
    expect(user).to be_valid
  end
  
  it "is not valid if it doesn't have an email" do
    user.email = nil

    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is not valid if email has a duplicate" do
    FactoryGirl.create(:user)

    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "is not valid if it doesn't have a password" do
    user.password = nil

    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is not valid if it doesn't have a firstname" do
    user.first_name = nil

    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is not valid if it doesn't have a lastname" do
    user.last_name = nil

    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "shows its full name" do
    user.first_name = "Arman"
    user.last_name  = "Miranda"

    expect(user.full_name).to eq "Arman Miranda"
  end

  it "is not valid if it doesn't have  a birthdate" do
    user.birthdate = nil

    user.valid?
    expect(user.errors[:birthdate]).to include("can't be blank")
  end

  it "is valid whether it has an address or not" do
    user.address = nil 
    expect(user).to be_valid

    user.address = "123 EZ St."
    expect(user).to be_valid 
  end

  context "#has_role? :teacher" do
    it "creates a resourse separate to the user" do
      expect(Teacher.all).to include teacher1.teacher
    end

    it "knows which subjects it can teaches" do
      teacher1.teacher.subjects << subject1
      teacher1.teacher.subjects << subject2

      expect(teacher1.teacher.subjects).to eq [subject1, subject2]
    end

    it "knows which class it advises" do
      teacher1.teacher.advisory_block = block1

      expect(teacher1.teacher.advisory_block).to eq block1
      expect(block1.advisory_teacher).to eq teacher1.teacher
    end

    it "knows which classes it teaches" do
      
    end

  end
  
  context "#has_role? :student" do
    it "creates a resource separate to the user" do
      expect(Student.all).to include student1.student
    end

    it "can be added to a block" do
      student1.student.blocks << block1

      expect(student1.student.blocks.first).to eq block1
    end
    
    it "can retrieve all subjects taken from the block"do
      block1.subjects << subject1
      student1.student.blocks <<  block1

      expect(student1.student.subjects).to eq [subject1]
    end

    it "can view all grades per subject"
  end
end
