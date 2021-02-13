module ApplicationHelper
  def welcome_logged_user
    current_user.username if logged_in?
  end

  def navcheck_signed_in
    if logged_in?
      link_to 'Sign Out', logout_path, method: :post, class:"nav-link"
    else
      link_to 'Sign In', login_path, class:"nav-link btn btn-outline-success"
    end
  end

  def navcheck_create_event
    link_to 'Create an Event', new_event_path, class:"btn btn-outline-success px-2 ml-0" if logged_in?
  end
end
