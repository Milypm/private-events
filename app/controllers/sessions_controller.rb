class SessionsController < ApplicationController
  def login

  end

  def create
    @user = User.find_by(username: params[:username])

    if @user
      sessions[:user_id] = @user.id 
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end
end