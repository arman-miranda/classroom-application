require "rails_helper"

RSpec.describe SubjectGradesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/subject_grades").to route_to("subject_grades#index")
    end

    it "routes to #new" do
      expect(:get => "/subject_grades/new").to route_to("subject_grades#new")
    end

    it "routes to #show" do
      expect(:get => "/subject_grades/1").to route_to("subject_grades#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/subject_grades/1/edit").to route_to("subject_grades#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/subject_grades").to route_to("subject_grades#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/subject_grades/1").to route_to("subject_grades#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/subject_grades/1").to route_to("subject_grades#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/subject_grades/1").to route_to("subject_grades#destroy", :id => "1")
    end

  end
end
