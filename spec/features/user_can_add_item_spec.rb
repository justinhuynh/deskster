require 'spec_helper'

feature "User can add a new Item", %(
  As a User
  I want to add a new desk item
  So I can keep track of the things on my desk

  Acceptance Criteria
  - I should see a form to add an Item on the Item index page
  - I must submit a name and description for the Item
) do

  scenario "user sees Item name, description and review" do
    visit '/'

    expect(page).to have_content "Add New Desk Item"
    fill_in "Name", with: "Pile of quarters"
    fill_in "Description", with: "Useful for doing laundry"
    click_on "Submit"

    expect(page).to have_content "Pile of quarters"
  end
end
