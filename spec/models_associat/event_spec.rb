require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validation' do
    it 'is invalid if description value is not a string' do
      new_event = Event.new(description: '', date: Date.today, location: 'Friend house').save
      expect(new_event).to be_falsy
    end

    it 'is valid if date is an instance of DateTime' do
      new_event = Event.new(description: 'Pool Party', date: '02/23/2021', location: 'Friend house').save
      expect(new_event).to be_falsy
    end

    it 'is invalid if location value is not a string' do
      new_event = Event.new(description: 'Pool Party', date: Date.tomorrow, location: '').save
      expect(new_event).to be_falsy
    end
  end

  context 'association' do
    it 'has many event_attendings' do
      have_many(:event_attendings)
    end

    it 'has many attendees' do
      have_many(:attendees)
    end
  end
end
