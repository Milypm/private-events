class EventsController < ApplicationController
  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully created' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  private

  def event_params
    params.require(:event).permit(:description, :date, :location, :creator_id)
  end
end
