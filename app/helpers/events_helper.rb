module EventsHelper
  # def future
  #   @future_events = []
  #   @events.each do |event|
  #     @future_events << event.description if event.date > Time.current
  #   end
  #   return @future_events
  # end

  # def past
  #   @past_events = []
  #   @events.each do |event|
  #     @past_events << event.description if event.date < Time.current
  #   end
  #   return @past_events
  # end

  # def details_btn_past(event)
  #   link_to 'Details', event_path(event), class:"btn btn-primary btn-sm py-0 my-1"  if past(event)
  # end

  # def details_btn_future(event)
  #   link_to 'Details', event_path(event), class:"btn btn-primary btn-sm py-0 my-1"  if future(event)
  # end

  def badge(event)
    'Host' if event.creator_id == current_user.id
  end

  def attend_btn_host
    for i in 0...1 do
      unless Event.find_by(id: @event.id).creator_id == current_user.id
        return button_to 'Attend Event', attend_event_path(@event.id), params: { attended_event_id: @event.id, event_attendee_id: current_user.id }, class:"btn btn-success" 
      
      else
        if EventAttending.find_by(event_attendee_id: current_user.id) == nil
          return button_to 'Attend Event', attend_event_path(@event.id), params: { attended_event_id: @event.id, event_attendee_id: current_user.id }, class:"btn btn-success"
        else
          if EventAttending.find_by(event_attendee_id: current_user.id).event_attendee_id == current_user.id
            return render 'events/attend_badge'
          else
            return button_to 'Attend Event', attend_event_path(@event.id), params: { attended_event_id: @event.id, event_attendee_id: current_user.id }, class:"btn btn-success"
          end
        end
      end
    end
  end
end
