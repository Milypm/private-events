module EventAttendingsHelper
  def attendings_show
    if @event.event_attendings.exists?
      render 'events/attendings_show_all'
    else
      render 'events/attendings_empty'
    end
  end
end
