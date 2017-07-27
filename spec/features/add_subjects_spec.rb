require 'rails_helper'

RSpec.feature "Add Subjects", type: :feature do
 scenario "The User creates a new Subject" do
    visit "subjects/new"
    fill_in "Name", with: 'Example Subject'
    fill_in "Code", with: 'Sample101'
    click_button 'Create Subject'
    expect(page).to have_content "Subject successfully created."
 end 
end
