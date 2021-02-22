class EventAttendingsController < ApplicationController
  def create
    @ev_attending = EventAttending.new(event_params)
    if @ev_attending.save
      redirect_to user_path(current_user.id), notice: 'Your attendance to this event is confirmed'
    end
  end

  def show
  end

  def destroy
    EventAttending.find_by(attended_event_id: event_params[:attended_event_id]).destroy
    redirect_to event_path(@event.id), notice: 'Your attendance to this event was succesfully removed.'
  end

  private

  def event_params 
    { attended_event_id: params[:attended_event_id], event_attendee_id: params[:event_attendee_id] }
  end
end
