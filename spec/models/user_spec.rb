require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "is valid if it has an email, password, firstname, lastname, birthdate, and address" do
    user = User.new(
      first_name: "Arman",
      last_name:  "Miranda",
      email:      "sample@sample.com",
      password:   "secret",
      birthdate:  "June 2, 1995",
      address:    "123 EZ St."
    )
    
    expect(user).to be_valid
  end
  
  it "is not valid if it doesn't have an email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is not valid if email has a duplicate" do
    User.create(
      first_name: "Arman",
      last_name:  "Miranda",
      email:      "sample@sample.com",
      password:   "secret",
      birthdate:  "June 2, 1995",
      address:    "123 EZ St."
    )

    user = User.new(
      first_name: "Arman",
      last_name:  "Miranda",
      email:      "sample@sample.com",
      password:   "secret",
      birthdate:  "June 2, 1995",
      address:    "123 EZ St."
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "is not valid if it doesn't have a password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is not valid if it doesn't have a firstname" do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is not valid if it doesn't have a lastname" do
    user = User.new(last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "is not valid if it doesn't have  a birthdate" do
    user = User.new(birthdate: nil)
    user.valid?
    expect(user.errors[:birthdate]).to include("can't be blank")
  end

  it "is valid whether it has an address or not" do
    user = User.new(
      first_name: "Arman",
      last_name:  "Miranda",
      email: "sample@sample.com",
      password: "secret",
      birthdate: "June 2, 1995",
      address: nil
    )
    expect(user).to be_valid

    user[:address] = "123 EZ St."
    expect(user).to be_valid 
  end

  context "#has_role? :admin" do
    it "is an admin" do
      user = User.new(
        first_name: "Arman",
        last_name:  "Miranda",
        email:      "sample@sample.com",
        password:   "secret",
        birthdate:  "June 2, 1995",
      )
      user.add_role :admin
      expect(user.has_role? :admin).to be_true
    end
  end

  context "#has_role? :teacher"
  
  context "#has_role? :student" 

end
