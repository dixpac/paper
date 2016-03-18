require 'rails_helper'

feature 'User views main page' do
  scenario 'sees list of notes' do
    note = create(:note)

    visit root_path

    within 'ul.notes' do
      expect(page).to have_content note.title
    end
  end

  scenario 'can add new note' do
    note = create(:note)
    visit root_path
    click_link 'New note'

    fill_form_and_submit(:notes,:new, attributes_for(:note))

    within 'ul.notes' do
      expect(page).to have_content note.title
    end
  end

  scenario 'can add new note' do
    note = create(:note)
    visit root_path
    page.find(".notes #row_#{note.id}>a").click

    fill_form_and_submit(:notes, :update, {title: 'New title'})

    within 'ul.notes' do
      expect(page).to have_content 'New title'
    end
  end

end
