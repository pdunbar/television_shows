require 'rails_helper'

feature 'list of characters' do

  # Acceptance Criteria:
  # * I can see a list of all the characters

  scenario 'user views characters' do
    characters = []
    characters_attrs = [
      { character: 'Richard', actor: 'Stephen', television_show_id: 1},
      { character: 'John', actor: 'Bob', television_show_id: 2}
    ]

    characters_attrs.each do |attrs|
      characters << Character.create(attrs)
    end

    visit '/characters'
    characters.each do |character|
      expect(page).to have_content character.character
      expect(page).to have_content character.actor
    end
  end
end
