require 'rails_helper'

RSpec.describe "subject_assignments/new", type: :view do
  before(:each) do
    assign(:subject_assignment, SubjectAssignment.new())
  end

  it "renders new subject_assignment form" do
    render

    assert_select "form[action=?][method=?]", subject_assignments_path, "post" do
    end
  end
end
