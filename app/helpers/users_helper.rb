module UsersHelper
  def welcome_logged_user
    "You are Logged In, #{current_user.username}" if logged_in?
  end
end
