module EventsHelper
  def attended_past
    current_user.attended_events.each do |event|
      event.description if past?(event.date)
    end
  end

  def attended_future
    current_user.attended_events.each do |event|
      event.description if future?(event.date)
    end
  end 

  def attend_btn
    if EventAttending.find_by(event_attendee_id: current_user.id).attended_event_id == @event.id
      'Attending Event'
    else
      button_to 'Attend Event', attend_event_path(@event.id), params: { attended_event_id: @event.id, event_attendee_id: current_user.id }, class:"btn btn-success"
    end
  end

  private

  def past?
    self < self.class.current
  end

  def future?
    self > self.class.current
  end
end
