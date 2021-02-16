class EventAttending < ApplicationRecord
  belongs_to :event_attendee, class: 'User'
  belongs_to :attended_event, class_name: 'Event'
end
