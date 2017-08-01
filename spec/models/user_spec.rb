require 'rails_helper'
require 'cancan/matchers'

RSpec.describe User, type: :model do
  
  let (:user) { FactoryGirl.build(:user) }

  it "has a valid factory" do
    expect(user).to be_valid
  end
  
  it "is not valid if it doesn't have an email" do
    user.email = nil

    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is not valid if email has a duplicate" do
    FactoryGirl.create(:user, email: "sample@sample.com")

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
    before(:each) do
      user.add_role :admin
    end

    it "is an admin" do
      expect(user.has_role? :admin).to be true
    end
    
    it "is not a teacher" do
      expect(user.has_role? :teacher).to be false
    end

    it "is not a student" do
      expect(user.has_role? :student).to be false
    end

    it "can manage all" do
      expect(user).to be_able_to(:manage, :all)
    end
  end

  context "#has_role? :teacher" do
    before(:each) do
      user.add_role :teacher
    end

    it "is a teacher" do
      expect(user.has_role? :teacher).to be true
    end

    it "is not an admin" do
      expect(user.has_role? :admin).to be false
    end

    it "is not a student" do
      expect(user.has_role? :student).to be false
    end

  end
  
  context "#has_role? :student" do
    before(:each) do
      user.add_role :student
    end

    it "is a student" do
      expect(user.has_role? :student).to be true
    end

    it "is not a teacher" do
      expect(user.has_role? :teacher).to be false
    end 

    it "is not an admin" do
      expect(user.has_role? :admin).to be false
    end
  end

end
