require 'rails_helper'

RSpec.describe Block, type: :model do

  let (:block1)   { FactoryGirl.build(:block) }
  let (:subject1) { FactoryGirl.build(:subject) }
  let (:subject2) { FactoryGirl.build(:subject) }
  let (:student1) { FactoryGirl.build(:student) }
  let (:student2) { FactoryGirl.build(:student) }
  let (:teacher1) { FactoryGirl.build(:teacher) }
  let (:teacher2) { FactoryGirl.build(:teacher) }

  it "has a valid factory" do
    expect(block1).to be_valid
  end

  it "is not valid without a name" do 
    block1.name = nil

    block1.valid?
    expect(block1.errors[:name]).to include "can't be blank"
  end

  it "does not allow duplicate section names per year level" do
    dup_block = FactoryGirl.create(:block, name: block1.name)

    block1.valid?
    expect(block1.errors[:name]).to include "has already been taken"
  end

  it "allows different year levels to have the same name" do
    diff_block = FactoryGirl.create(:block, name: block1.name, year_level: 2)

    expect(block1).to be_valid 
  end

  it "is not valid without a year level" do
    block1.year_level = nil

    block1.valid?
    expect(block1.errors[:year_level]).to include "can't be blank"
  end

  it "knows its students" do
    student1.blocks << block1
    student1.save!
    student2.blocks << block1
    student2.save!
    teacher1.blocks << block1
    teacher1.save!

    expect(block1.students).to eq [student1, student2]
  end

  it "knows its advisor" do
    block1.advisory_teacher = teacher1

    expect(block1.advisory_teacher).to eq teacher1
  end

  it "knows all the teachers that teaches under it" do
    subject1.users << [teacher1, teacher2, student1, student2]
    block1.subjects << subject1
    teacher1.assign(block1)
    teacher1.save!
    teacher2.assign(block1)
    teacher2.save!

    expect(block1.teachers).to eq [teacher1, teacher2]
  end

  it "knows all the subject that is assigned under it" do
     block1.subjects << subject1
     block1.subjects << subject2

     expect(block1.subjects).to eq [subject1, subject2]
   end

end
