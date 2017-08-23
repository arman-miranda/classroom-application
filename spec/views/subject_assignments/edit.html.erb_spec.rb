require 'rails_helper'

RSpec.describe "subject_assignments/edit", type: :view do
  before(:each) do
    @subject_assignment = assign(:subject_assignment, SubjectAssignment.create!())
  end

  it "renders the edit subject_assignment form" do
    render

    assert_select "form[action=?][method=?]", subject_assignment_path(@subject_assignment), "post" do
    end
  end
end
