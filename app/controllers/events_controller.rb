class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: 'Event was successfully created'
    else
      render :new
    end
  end

  def show
    @find_event = Event.find(params[:id]).creator_id
    @creator = User.find(@find_event)
  end

  private

  def event_params
    params.require(:event).permit(:description, :date, :location, :creator_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
