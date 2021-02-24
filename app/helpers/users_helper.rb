module UsersHelper
  def users_attended_events
    render 'users/users_events_empty' if @attended_events.empty?

    render 'users/users_show_events'
  end

  def users_created_events
    render 'users/users_events_empty' if @created_events.empty?

    render 'users/users_created_events'
  end
end
