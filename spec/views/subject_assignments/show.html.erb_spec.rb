require 'rails_helper'

RSpec.describe "subject_assignments/show", type: :view do
  before(:each) do
    @subject_assignment = assign(:subject_assignment, SubjectAssignment.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
