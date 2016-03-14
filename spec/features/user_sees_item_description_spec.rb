require 'spec_helper'

feature "User views the Item show page", %(
  As a User
  I want to view details about a specific item
  So I can learn more about why it is on my desk

  Acceptance Criteria
  - Clicking on a link from the Item index page should take me to the item's show page
  - I should see the Item's name, description and reviews
) do

  scenario "user sees Item name, description and review" do
    item_1 = Item.create(name: "PORO", description: "Not that kind of PORO, silly!")
    item_2 = Item.create(name: "Lamp", description: "I love lamp")

    review_1 = Review.create(body: "it's fluffy. so fluffy!!", username: "nick", item: item_1)

    visit '/'

    click_link item_1.name

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.description)

    expect(page).to_not have_content(item_2.name)
    expect(page).to have_content(review_1.body)
  end
end
