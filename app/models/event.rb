class Event < ApplicationRecord
  validates :description, presence: true
  
  has_many :event_attendings, foreign_key: 'attended_event_id'
  has_many :attendees, through: 'event_attendings', source: 'event_attendee', class_name: 'User', foreign_key: 'user_id'
  belongs_to :creator, class_name: 'User'
end
