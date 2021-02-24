# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventAttending, type: :model do
  context 'association' do
    it 'belong to event_attendee' do
      assc = EventAttending.reflect_on_association(:event_attendee)
      expect(assc.macro).to eq :belongs_to
    end

    it 'belong to attended_event' do
      assc = EventAttending.reflect_on_association(:attended_event)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
