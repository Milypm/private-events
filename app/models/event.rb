# frozen_string_literal: true

class Event < ApplicationRecord
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true

  has_many :event_attendings, foreign_key: 'attended_event_id', dependent: :destroy
  has_many :attendees, through: 'event_attendings', source: 'event_attendee', class_name: 'User', foreign_key: 'user_id'
  belongs_to :creator, class_name: 'User'

  scope :past, -> { where('date < ?', Time.current) }
  scope :future, -> { where('date >= ?', Time.current) }
end
