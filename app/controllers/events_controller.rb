class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to events_path, notice: 'Event was successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private

  def event_params
    params.require(:event).permit(:description, :date, :location, :creator_id)
  end
end
