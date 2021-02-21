class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  helper_method :log_out
  helper_method :find_creator
  helper_method :future
  helper_method :past


  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    reset_session
    current_user = nil
  end

  def future
    future_events = []
    @events.each do |event|
      future_events << event.description if event.date > Time.current
    end
    @future_events
  end

  def past
    past_events = []
    @events.each do |event|
      past_events << event.description if event.date < Time.current
    end
    @past_events
  end
end
