class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username].downcase)
    if @user
      session[:user_id] = user.id
      redirect_to '/welcome'
    else
      redirect_to '/login', notice: 'Invalid username'
      # render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end