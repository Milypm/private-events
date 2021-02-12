module ApplicationHelper
def welcome_logged_user
  current_user.username if logged_in?
end
end
