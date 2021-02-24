# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sessions', type: :feature do
  let(:user) { User.create(username: 'Richard') }

  def login(user)
    visit '/login'
    fill_in 'Username', with: user.username
    click_button
  end

  describe 'Signin process' do
    it 'signs user in' do
      visit '/login'
      fill_in 'Username', with: user.username
      click_button
      page.should have_content('Welcome!')
    end
  end

  describe 'Signout process' do
    it 'signs user out' do
      visit '/login'
      fill_in 'Username', with: user.username
      click_button
      click_link 'Sign Out'
      page.should have_content('Welcome to private-events!')
    end
  end
end
