class SessionsController < ApplicationController
  def new
  end

  def show
  end
  
  def create
    user = User.find_by_username(params[:login][:username])
    if user
      log_in(user)
      redirect_to user_path(current_user.id)
    else
      redirect_to '/login', notice: 'Invalid username'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :id)
  end
end