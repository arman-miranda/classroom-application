require 'rails_helper'

RSpec.describe User, type: :model do
  
  let (:user)    { FactoryGirl.build(:user) }
  let (:admin)   { FactoryGirl.build(:admin) }
  let (:teacher) { FactoryGirl.build(:teacher) }
  let (:student) { FactoryGirl.build(:student) }
  let (:subject1) { FactoryGirl.build(:subject) }
  let (:subject2) { FactoryGirl.build(:subject, name: "C Programming", 
                                       code: "CS102") }
  let (:subject3) { FactoryGirl.build(:subject, name: "Filipino 1", 
                                      code: "Fil 1") }
  let (:block1) { FactoryGirl.build(:block) }

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

  context "#has_role? :admin" do
    it "is an admin" do
      expect(admin.has_role? :admin).to be true
    end
    
    it "is not a teacher" do
      expect(admin.has_role? :teacher).to be false
    end

    it "is not a student" do
      expect(admin.has_role? :student).to be false
    end

  end

  context "#has_role? :teacher" do
    it "is a teacher" do
      expect(teacher.has_role? :teacher).to be true
    end

    it "is not an admin" do
      expect(teacher.has_role? :admin).to be false
    end

    it "is not a student" do
      expect(teacher.has_role? :student).to be false
    end

    it "has a subject that it teaches" do
      teacher.subjects << subject1
      expect(teacher.subjects).to include subject1
    end

    it "knows which subjects it teaches" do
      teacher.subjects << subject1
      teacher.subjects << subject2

      expect(teacher.subjects).to include subject1, subject2
      expect(teacher.subjects).not_to include subject3
    end

    it "knows which class it advises" do
      teacher.block = block1

      expect(teacher.block).to eq block1 
    end

    it "knows which classes it teaches"

  end
  
  context "#has_role? :student" do
    it "is a student" do
      expect(student.has_role? :student).to be true
    end

    it "is not a teacher" do
      expect(student.has_role? :teacher).to be false
    end 

    it "is not an admin" do
      expect(student.has_role? :admin).to be false
    end

    it "is capable of taking a subject" do
      student.subjects << subject1
      expect(student.subjects).to eq [subject1] 
    end

    it "is capable of taking multiple subjects" do
      student.subjects << subject1
      student.subjects << subject2

      expect(student.subjects).to include  subject1, subject2
      expect(student.subjects).not_to include subject3
    end
  end

end
