require "rails_helper"

RSpec.describe Event, :type => :model do
  subject { Event.new(description: 'Pool Party', date: DateTime.current + 4.months, location: 'Friend house') }

  context 'validation' do
    it 'is not valid if there is not a description' do
      subject.description = ''
      expect(subject).not_to be_valid
    end

    it 'is valid if there is a date' do
      subject.date = DateTime.current + 15.days
      expect(subject).to be_valid
    end

    it 'is not valid if there is not a location' do
      subject.location = nil
      expect(subject).not_to be_valid
    end
  end

  context 'association' do
    it 'has many event_attendings' do
      expect(subject).to have_many(:event_attendings)
    end

    it 'has many attendees' do
      expect(subject).to have_many(:attendees)
    end

    it 'belong to creator' do
      expect(subject).to belong_to(:creator)
    end
  end
end