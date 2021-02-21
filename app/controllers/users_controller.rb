class UsersController < ApplicationController
  def index
    @users = User.all.order(:username)
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_path(current_user.id), notice: 'Succesful Sign Up'
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    reset_session if @user == current_user
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
