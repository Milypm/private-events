class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user
      log_in(user)
      redirect_to '/welcome'
    else
      # redirect_to '/login', notice: 'Invalid username'
      render new_user_url
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end