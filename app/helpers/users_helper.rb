module UsersHelper
  def users_attended_events
    render 'users/users_events_empty' if @attended_events.empty?

    render 'users/users_show_events'
  end

  def users_created_events
    render 'users/users_events_empty' if @created_events.empty?

    render 'users/users_created_events'
  end

  def users_edit_btn
    link_to 'Edit User', edit_user_path(@user), class: 'btn btn-secondary my-3' if current_user
  end

  def users_delete_btn
    if current_user
      link_to 'Delete User', user_path(@user), method: :delete, data: { confirm: 'Are you sure?' },
                                               class: 'btn btn-danger my-3'
    end
  end
end
