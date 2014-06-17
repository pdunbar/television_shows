require 'rails_helper'

feature 'user adds a tv character' do
  scenario 'form present to add character' do
    visit '/television_shows/1'
    fill_in "Character", with: "Richard"
    fill_in "Actor", with: "Stephen"
    click_on "Create Character"

    expect(page).to have_content "Richard"
  end




end
