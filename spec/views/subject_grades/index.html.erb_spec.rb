require 'rails_helper'

RSpec.describe "subject_grades/index", type: :view do
  before(:each) do
    assign(:subject_grades, [
      SubjectGrade.create!(),
      SubjectGrade.create!()
    ])
  end

  it "renders a list of subject_grades" do
    render
  end
end
