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

  def alerts
    render 'layouts/alerts' if notice
  end

  def nav_signin_signout
    if logged_in?
      render 'layouts/nav_signout'
    else
      render 'layouts/nav_signin'
    end
  end
end
