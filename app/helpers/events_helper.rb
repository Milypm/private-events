module EventsHelper
  def badge(event)
    'Creator' if event.creator_id == current_user.id
  end

  def attend_btn
    attend_btn = button_to 'Attend Event', attend_event_path(@event.id),
                           params: {
                             attended_event_id: @event.id,
                             event_attendee_id: current_user.id
                           }, class: 'btn btn-success'
    if EventAttending.find_by(attended_event_id: @event.id).nil?
      attend_btn
    elsif EventAttending.exists?(attended_event_id: @event.id, event_attendee_id: current_user.id)
      render 'events/attend_badge'
    else
      attend_btn
    end
  end

  def unattend_btn
    return unless EventAttending.exists?(attended_event_id: @event.id, event_attendee_id: current_user.id)

    button_to 'Unattend Event', cancel_event_attending_path(@event.id),
              params: {
                attended_event_id: @event.id,
                event_attendee_id: current_user.id
              }, method: :delete, class: 'btn btn-outline-secondary btn-sm mt-2'
  end

  def events_show
    render 'events/events_empty' if @events.empty?

    render 'events/events_show_all'
  end

  def events_edit_btn
    link_to 'Edit Event', edit_event_path(@event), class: 'btn btn-secondary my-3' if current_user == @event.creator
  end

  def events_delete_btn
    return unless current_user == @event.creator

    link_to 'Delete Event', event_path(@event), method: :delete, data: { confirm: 'Are you sure?' },
                                                class: 'btn btn-danger my-3'
  end
end
