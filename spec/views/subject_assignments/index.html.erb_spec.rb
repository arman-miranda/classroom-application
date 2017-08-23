require 'rails_helper'

RSpec.describe "subject_assignments/index", type: :view do
  before(:each) do
    assign(:subject_assignments, [
      SubjectAssignment.create!(),
      SubjectAssignment.create!()
    ])
  end

  it "renders a list of subject_assignments" do
    render
  end
end
