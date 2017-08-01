require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.new({email: "sample@sample.com", password: "secret"})}
  
  it "is valid if it has an email, password, firstname, lastname, birthdate, and address"
  
  it "is not valid if it doesn't have an email"

  it "is not valid if email has a duplicate"

  it "is not valid if it doesn't have a password"

  it "is not valid if it doesn't have a firstname"

  it "is not valid if it doesn't have a lastname"

  it "is valid if it has a birthdate"

  it "is valid if it has an address"

  context "#has_role? :admin"

  context "#has_role? :teacher"
  
  context "#has_role? :student" 

end
