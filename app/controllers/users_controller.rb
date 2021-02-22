class UsersController < ApplicationController
  def index
    @users = User.all.order(:username)
  end

  def show
    @user = User.find_by_id(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_path(current_user.id), notice: 'Succesfully Signed Up.'
    else
      render 'new'
    end
  end

  def destroy
    reset_session if @user == current_user
    current_user.destroy
    redirect_to root_path, notice: 'User was successfully deleted.'
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
