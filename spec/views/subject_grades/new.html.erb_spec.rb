require 'rails_helper'

RSpec.describe "subject_grades/new", type: :view do
  before(:each) do
    assign(:subject_grade, SubjectGrade.new())
  end

  it "renders new subject_grade form" do
    render

    assert_select "form[action=?][method=?]", subject_grades_path, "post" do
    end
  end
end
