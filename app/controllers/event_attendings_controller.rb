class EventAttendingsController < ApplicationController
  def index
  end

  def create
    @ev_attending = EventAttending.create(event_attending_params)
    if @ev_attending.save
      redirect_to events_path(event_attending_params[:attended_event_id]), notice: 'Your attendance to this event is confirmed'
    end
  end

  def attend_event
  end

  def show
  end

  private

  def event_attending_params
    params.require(:event_attending).permit(:attended_event_id, :event_attendee_id)
  end
end
