class EventAttendingsController < ApplicationController
  def index
  end

  def new
    @ev_attending = EventAttending.new
  end

  def create
    @ev_attending = EventAttending.new(event_attending_params)
    if @ev_attending.save
      redirect_to event_path(event_attending_params[:attended_event_id]), notice: 'Your attendance to this event is confirmed'
    else
      render: 'new'
    end
  end

  def show
  end

  private

  def event_attending_params
    params.require(:event_attending).permit(:attended_event_id, :event_attendee_id)
  end
end
