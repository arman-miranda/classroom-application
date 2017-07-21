require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe "initialization" do

    let (:subject) { Subject.new }

    it "has a name that can't be blank" do
      expect(subject.name).to be_falsy
      subject.name = "Computer Fundamentals"
      expect(subject.name).to be_truthy
    end

    it "has an optional subject code" do
      subject.code = "CS101"
      expect(subject.code).to be_truthy
    end

    it "can be taught by a teacher" do
      sam = Teacher.new
      subject.teachers << sam
      expect(subject.teachers.count).to eq 1
    end
    
  end
end
