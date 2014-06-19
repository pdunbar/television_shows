require 'rails_helper'

feature 'user adds a tv character' do

  scenario 'form present to add character' do
    show = TelevisionShow.create!(title: 'Game of Thrones',
      network: 'HBO' )

    visit "/television_shows/#{show.id}"
    fill_in "Character", with: "Richard"
    fill_in "Actor", with: "Stephen"
    click_on "Submit"

    expect(page).to have_content "Richard"
    expect(page).to have_content "Stephen"
  end

  scenario 'without required attributes' do
    show = TelevisionShow.create!(title: 'Game of Thrones',
      network: 'HBO' )

    visit "/television_shows/#{show.id}"

    click_on 'Submit'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "can't be blank"
  end

  scenario 'and character already exists' do
    show = TelevisionShow.create!(title: 'Game of Thrones',
      network: 'HBO' )
    character = Character.create!(actor: "Stephen", character: "Richard", television_show_id: 1)

    visit "television_shows/#{show.id}"
    fill_in "Character", with: "Richard"
    fill_in "Actor", with: "John"
    click_on "Submit"

    expect(page).to have_content "character already exists"

  end


end
