class EventAttendingsController < ApplicationController
  def create
    @ev_attending = EventAttending.new(event_params)
    if @ev_attending.save
      redirect_to events_path, notice: 'Your attendance to this event is confirmed'
    end
  end

  def show
  end

  private

  def event_params 
    { attended_event_id: params[:attended_event_id], event_attendee_id: params[:event_attendee_id] }
  end
end
