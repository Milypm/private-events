module ApplicationHelper
  def welcome_logged_user
    current_user.username if logged_in?
  end

  def navcheck_main
    if logged_in?
      link_to 'private-events!', user_path(current_user.id), class:"navbar-brand fs-5 fw-bold"
    else
      link_to 'private-events!', root_path, class:"navbar-brand fs-5 fw-bold"
    end
  end

  def navcheck_user
    link_to welcome_logged_user, user_path(current_user.id), class:"btn btn-outline-success py-0 px-2 fw-bold" if logged_in?
  end

  def navcheck_sign_inbtn
    link_to 'Sign In', login_path, class:"nav-link btn btn-outline-success fw-bold" unless logged_in?
  end

  def navcheck_sign_outbtn
    link_to 'Sign Out', logout_path, method: :post, class:"nav-link fw-bold" if logged_in?
  end

  def navcheck_create_event
    link_to 'Create an Event', new_event_path, class:"btn btn-outline-success my-1" if logged_in?
  end

  def navcheck_allevents
    link_to 'Events', events_path, class:"btn btn-outline-success my-1" if logged_in?
  end
end
