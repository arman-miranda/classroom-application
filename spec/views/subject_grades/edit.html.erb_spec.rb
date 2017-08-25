require 'rails_helper'

RSpec.describe "subject_grades/edit", type: :view do
  before(:each) do
    @subject_grade = assign(:subject_grade, SubjectGrade.create!())
  end

  it "renders the edit subject_grade form" do
    render

    assert_select "form[action=?][method=?]", subject_grade_path(@subject_grade), "post" do
    end
  end
end
