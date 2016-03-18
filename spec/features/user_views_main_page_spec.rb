require 'rails_helper'

feature 'User views main page' do
  scenario 'it sees list of notes' do
    note = create(:note)

    visit root_path

    within 'ul.notes' do
      expect(page).to have_content note.title
    end

  end
end
