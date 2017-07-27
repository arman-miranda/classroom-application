require 'rails_helper'

RSpec.describe Block, type: :model do

  it "has a name" do 
    some_block = Block.new
    expect(some_block.name).to be_falsy

    some_block.name = "CS-B"
    expect(some_block.name).to be_truthy
  end

  it "has a year level" do
    some_block = Block.new
    expect(some_block.year_level).to be_falsy

    some_block.year_level = 1
    expect(some_block.year_level).to be_truthy
  end

  it "should have students"

  it "should have an advisory teacher"

  it "should have multiple teachers through subjects"

end
