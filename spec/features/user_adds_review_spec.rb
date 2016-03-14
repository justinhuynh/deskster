require 'spec_helper'

feature "User can add review for an item", %(
  As a User
  I want add a review about an item
  So others know what I think about that item

  Acceptance Criteria
  - I should see a form to add a Review on the Item show page
  - I must submit a body for the Review, and optionally, a username
) do

  scenario "user successfully adds new review on the Item show page" do
    item_1 = Item.create(name: "PORO", description: "Not that kind of PORO, silly!")
    item_2 = Item.create(name: "Lamp", description: "I love lamp")

    visit '/'
    click_link 'PORO'

    expect(page).to have_content "Add New Review"

    fill_in "Body", with: "So cute"
    fill_in "Username", with: "POROfan"
    click_on "Submit"

    expect(page).to have_content item_1.name
    expect(page).to have_content item_1.description

    expect(page).to have_content "So cute"
    expect(page).to have_content "POROfan"
  end
end
