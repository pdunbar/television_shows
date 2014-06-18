require 'rails_helper'

feature 'user adds a tv character' do

  scenario 'form present to add character' do
    show = TelevisionShow.create!(title: 'Game of Thrones',
      network: 'HBO' )

    visit '/television_shows/#{show.id}'
    fill_in "Character", with: "Richard"
    fill_in "Actor", with: "Stephen"
    click_on "Create Character"

    expect(page).to have_content "Richard"
    expect(page).to have_content "Stephen"
  end

  scenario 'without required attributes' do
    visit '/television_shows/show'
    click_on 'Submit'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "can't be blank"
  end
end
