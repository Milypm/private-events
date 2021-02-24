# frozen_string_literal: true

class EventAttendingsController < ApplicationController
  before_action :set_ev_attending, only: [:destroy]

  def create
    @ev_attending = EventAttending.new(event_params)
    redirect_to user_path(current_user.id), notice: 'Your attendance to this event is confirmed.' if @ev_attending.save
  end

  def destroy
    @ev_attending.destroy
    redirect_to events_path, notice: 'Your attendance to this event was succesfully removed.'
  end

  private

  def event_params
    { attended_event_id: params[:attended_event_id], event_attendee_id: params[:event_attendee_id] }
  end

  def set_ev_attending
    @ev_attending = EventAttending.find_by(attended_event_id: event_params[:attended_event_id])
  end
end
