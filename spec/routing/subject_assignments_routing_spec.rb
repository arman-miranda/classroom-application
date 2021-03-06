require "rails_helper"

RSpec.describe SubjectAssignmentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/subject_assignments").to route_to("subject_assignments#index")
    end

    it "routes to #new" do
      expect(:get => "/subject_assignments/new").to route_to("subject_assignments#new")
    end

    it "routes to #show" do
      expect(:get => "/subject_assignments/1").to route_to("subject_assignments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/subject_assignments/1/edit").to route_to("subject_assignments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/subject_assignments").to route_to("subject_assignments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/subject_assignments/1").to route_to("subject_assignments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/subject_assignments/1").to route_to("subject_assignments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/subject_assignments/1").to route_to("subject_assignments#destroy", :id => "1")
    end

  end
end
