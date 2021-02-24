class User < ApplicationRecord
  validates :username, presence: true

  has_many :event_attendings, foreign_key: 'event_attendee_id', dependent: :destroy
  has_many :attended_events, foreign_key: 'event_attendee_id', through: 'event_attendings', class_name: 'Event'
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event', dependent: :destroy
end
