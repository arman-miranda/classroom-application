require 'rails_helper'

RSpec.feature "Add Subjects", type: :feature do
 scenario "The User creates a new Subject" do
    visit "subjects/new"
    fill_in :name, with: 'Example Subject'
    fill_in :code, with: 'Sample101'
    click_button 'Create Subject'
 end 
end
