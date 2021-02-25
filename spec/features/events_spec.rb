require 'rails_helper'

RSpec.describe 'events', type: :feature do
  let(:user) { User.create(username: 'Richard') }
  let(:user2) { User.create(username: 'Ricky') }
  let(:event1) { Event.new(creator_id: user.id, description: 'Pool Party', date: DateTime.current) }
  let(:event2) { Event.new(creator_id: user.id, description: 'RoR CodingCamp', date: DateTime.tomorrow) }
  let(:attended_event) { EventAttending.create(attended_event_id: event1.id, event_attendee_id: user.id) }

  def login(user)
    visit '/login'
    fill_in 'Username', with: user.username
    click_button
  end

  def log_in(user2)
    visit '/login'
    fill_in 'Username', with: user2.username
    click_button
  end

  def setting_date(datetime)
    select datetime.strftime('%Y'), from: 'event_date_1i'
    select datetime.strftime('%B'), from: 'event_date_2i'
    select datetime.strftime('%-d'), from: 'event_date_3i'
    select datetime.strftime('%H'), from: 'event_date_4i'
    select datetime.strftime('%M'), from: 'event_date_5i'
  end

  def user_saves_event(user)
    user.save
    login(user)
    event2.save
  end

  context 'views:' do
    it 'creates an event' do
      user.save
      login(user)
      visit '/events/new'
      fill_in 'Description', with: event1.description
      setting_date event1.date
      fill_in 'Location', with: event1.location
      click_button
      expect(page).to have_content event1.location
    end

    it 'displays events created by the user on events/index page' do
      user.save
      login(user)
      event1.save
      event2.save
      visit '/events'
      expect(page).to have_content event2.location
    end
  end

  feature 'User edits an event' do
    scenario 'if user is the creator of the event' do
      user_saves_event(user)
      visit events_path(event2)
      page.has_button?('Edit Event')
    end

    scenario 'if user is not the creator of the event' do
      user_saves_event(user)
      click_link 'Sign Out'
      user2.save
      log_in(user2)
      visit events_path(event2)
      expect(page).to have_no_button('Edit Event')
    end
  end
end
