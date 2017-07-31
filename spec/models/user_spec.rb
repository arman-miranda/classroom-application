require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.new({email: "sample@sample.com", password: "secret"})}
  
  it "is valid if it has a first name" do
    expect(user).not_to be_valid

    user.first_name = "Arman"
    expect(user).to be_valid
  end

  it "is valid if it has a last name" do
    expect(user).not_to be_valid

    user.last_name = "Miranda"
    expect(user).to be_valid
  end

  it "is valid if it has a birthdate"

  it "is valid if it has an address"

  context "#has_role? :admin"

  context "#has_role? :teacher"
  
  context "#has_role? :student" 

end
