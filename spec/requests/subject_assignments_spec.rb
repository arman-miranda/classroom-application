require 'rails_helper'

RSpec.describe "SubjectAssignments", type: :request do
  describe "GET /subject_assignments" do
    it "works! (now write some real specs)" do
      get subject_assignments_path
      expect(response).to have_http_status(200)
    end
  end
end
