# frozen_string_literal: true

module ApplicationHelper
  def root_page
    if logged_in?
      render 'home/logged'
    else
      render 'home/not_logged'
    end
  end

  def welcome_logged_user
    current_user.username if logged_in?
  end

  def navcheck_main
    if logged_in?
      link_to 'My Events!', user_path(current_user.id), class: 'navbar-brand fs-4 fw-bold text-success'
    else
      link_to 'private-events!', root_path, class: 'navbar-brand fs-4 fw-bold text-success'
    end
  end

  def navcheck_user
    "Hi, #{current_user.username} :)" if logged_in?
  end

  def navcheck_sign_upbtn
    link_to 'Sign Up', new_user_path, class: 'btn btn-secondary'
  end

  def navcheck_sign_inbtn
    link_to 'Sign In', login_path, class: 'nav-link btn btn-outline-success fw-bold' unless logged_in?
  end

  def navcheck_sign_outbtn
    link_to 'Sign Out', logout_path, method: :post, class: 'nav-link fw-bold' if logged_in?
  end

  def navcheck_create_event
    link_to 'Create an Event', new_event_path, class: 'btn btn-outline-success my-1' if logged_in?
  end

  def navcheck_allevents
    link_to 'Events', events_path, class: 'btn btn-outline-success my-1' if logged_in?
  end

  def alerts
    render 'layouts/alerts' if notice
  end
end
