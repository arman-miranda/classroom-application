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
    
    it "could have subject prerequisites" 

    it "could have a final grade"
    
    it "could be considered finished if graded"

    it "has multiple teachers assigned to it"
    
    it "has to have at least one class"
    
    it "is appropriated to a certain year level"
    
    it "belongs to a course"
  end
end
