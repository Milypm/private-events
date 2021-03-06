require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(username: 'Richard') }

  context 'validation' do
    it 'is valid if there is a username' do
      expect(subject).to be_valid
    end

    it 'is not valid if there is not a username' do
      subject.username = nil
      expect(subject).to_not be_valid
    end
  end

  context 'association' do
    it 'has many event_attendings' do
      have_many(:event_attendings)
    end

    it 'has many attended_events' do
      have_many(:attended_events)
    end

    it 'has many created_events' do
      have_many(:created_events)
    end
  end
end
