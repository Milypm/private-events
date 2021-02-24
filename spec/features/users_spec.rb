require 'rails_helper'

RSpec.describe 'users', type: :feature do
  let(:user) { User.create(username: 'Richard') }
  let(:event) { Event.new(creator_id: user.id, description: 'Pool Party', date: DateTime.current) }
  let(:attended_event) { EventAttending.new(attended_event_id: event.id, event_attendee_id: user.id) }

  describe 'sign up process' do
    it 'signs me up' do
      visit '/users/new'
      fill_in 'Username', with: user.username
      click_button 'Create User'
      page.should have_content 'Welcome!'
    end
  end

  def login(user)
    visit '/login'
    fill_in 'Username', with: user.username
    click_button
  end

  context 'views:' do
    it 'displays events attended by the user on their show page' do
      user.save
      login(user)
      event.save
      attended_event.save
      visit user_path(user)
      expect(page).to have_content event.location
    end
  end

  describe 'Edit user process' do
    it 'updates username' do
      user.save
      login(user)
      visit user_path(user)
      click_link 'Edit User'
      fill_in 'Username', with: user.username
      click_button
      page.should have_content('Username was succesfully updated.')
    end
  end
end
