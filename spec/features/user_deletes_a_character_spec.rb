require 'rails_helper'

feature 'deletes a character' do
  scenario 'user deletes a character from show page' do
    show = TelevisionShow.create(title: 'Game of Thrones',
      network: 'HBO', id: 1)

    characters = []

    characters_attrs = [
      {actor: 'Larry', character: 'Greg', description: 'Greg is the bad guy', television_show_id: 1}
    ]
    characters_attrs.each do |attrs|
      characters << Character.create(attrs)
    end

    visit "/television_shows/#{show.id}"

    click_on 'Delete'

    characters.each do |character|
      expect(page).to_not have_content character.character
      expect(page).to_not have_content character.actor
    end

  end
end
