require "rails_helper"

RSpec.describe EventAttending, :type => :model do
  context 'association' do
    it 'belong to event_attendee' do
      expect(EventAttending).to belong_to(:event_attendee)
    end

    it 'belong to attended_event' do
      expect(EventAttending).to belong_to(:attended_event)
    end
  end
end