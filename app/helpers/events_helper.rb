module EventsHelper
  def past(event)
    event.description if event.date < Time.current
  end

  def future(event)
    event.description if event.date > Time.current
  end

  def details_btn_past(event)
    link_to 'Details', event_path(event), class:"btn btn-primary btn-sm py-0 my-1"  if past(event)
  end

  def details_btn_future(event)
    link_to 'Details', event_path(event), class:"btn btn-primary btn-sm py-0 my-1"  if future(event)
  end

  def badge_p(event)
    'Host' if past(event) && event == current_user.id
  end

  def badge_f(event)
    'Host' if future(event) && event == current_user.id
  end

  def attend_btn
    if EventAttending.find_by(event_attendee_id: current_user.id) == nil
      button_to 'Attend Event', attend_event_path(@event.id), params: { attended_event_id: @event.id, event_attendee_id: current_user.id }, class:"btn btn-success"
    else
      if EventAttending.find_by(event_attendee_id: current_user.id).attended_event_id == @event.id
        'Attending Event'
      else
        button_to 'Attend Event', attend_event_path(@event.id), params: { attended_event_id: @event.id, event_attendee_id: current_user.id }, class:"btn btn-success"
      end
    end
  end
end
