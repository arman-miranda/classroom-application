require 'rails_helper'

RSpec.describe "subject_grades/show", type: :view do
  before(:each) do
    @subject_grade = assign(:subject_grade, SubjectGrade.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
