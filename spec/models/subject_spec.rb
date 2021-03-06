require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe "initialization" do

    let (:subject1) { 
      FactoryGirl.build(:subject) 
    }

    let (:teacher1) { FactoryGirl.create(:teacher) }
    let (:teacher2) { FactoryGirl.create(:teacher) }
    let (:student1) { FactoryGirl.create(:student) }
    let (:student2) { FactoryGirl.create(:student) }
    let (:admin)    { FactoryGirl.create(:admin)   }
    let (:block1)   { FactoryGirl.create(:block)   }
    let (:block2)   { FactoryGirl.create(:block)   } 
    
    it "has a valid factory" do
      expect(subject1).to be_valid
    end

    it "is not valid without a name" do
      subject1.name = nil

      subject1.valid?
      expect(subject1.errors[:name]).to include("can't be blank")
    end

    it "has an optional subject code" do
      subject1.code = nil
      expect(subject1).to be_valid

      subject1.code = "CS101"
      expect(subject1).to be_valid
    end
    
    it "is able to identify a teacher who teaches it" do
      subject1.teachers << [teacher1]
      expect(subject1.teachers).to eq [teacher1]
    end

    it "is able to identify all the teachers who teaches it" do
      subject1.teachers << [teacher1, teacher2]

      expect(subject1.teachers).to eq [teacher1, teacher2]
    end
    
    it "is able to identify a student who takes it" do
      block1.subjects << subject1
      student1.blocks << block1

      expect(subject1.students).to eq [student1]
    end

    it "is able to identify all the students who takes it" do
      block1.subjects << subject1
      student1.blocks << block1
      student2.blocks << block1

      expect(subject1.students).to eq [student1, student2]
    end

    it "can be assigned to multiple blocks" do
      subject1.blocks << block1
      subject1.blocks << block2

      expect(subject1.blocks).to eq [block1, block2]
    end

    it "could assign grades to its users"
    
    it "could be considered finished if graded"

    it "could have subject prerequisites" 
    
    it "is appropriated to a certain year level"
    
    it "belongs to a course"
  end
end
