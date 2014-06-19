require 'rails_helper'

feature 'views a characters tv show page' do
  scenario 'user views show page from character list' do
    show = TelevisionShow.create(title: 'Game of Thrones',
      network: 'HBO', id: 1)

    characters = []

    characters_attrs = [
      {actor: 'Jeff', character: 'Stan', description: 'Stan is the protagonist', television_show_id: 1},
      {actor: 'Larry', character: 'Greg', description: 'Greg is the bad guy', television_show_id: 1}
    ]
    characters_attrs.each do |attrs|
      characters << Character.create(attrs)
    end

    visit "/television_shows/#{show.id}"

    expect(page).to have_content show.title
    expect(page).to have_content show.network
    expect(page).to have_content show.years
    expect(page).to have_content show.synopsis

    characters.each do |character|
      expect(page).to have_content character.character
      expect(page).to have_content character.actor
    end

  end
end
