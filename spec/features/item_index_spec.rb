require 'spec_helper'

feature "User views the Item index page", %(
  As a User
  I want to see a list of things on my desk
  So I can tell others about the things on my desk

  Acceptance Criteria
  - I must see the name of all the Items in the database
  - I should not see a description of the Item
) do
  
  scenario "user sees a list of Items" do
    item_1 = Item.create(name: "PORO", description: "Not that kind of PORO, silly!")
    item_2 = Item.create(name: "Lamp", description: "I love lamp")

    visit '/'

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_2.name)
  end
end
