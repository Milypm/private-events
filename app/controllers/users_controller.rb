# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def index
    @users = User.all.order(:username)
  end

  def show; end

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

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Username was succesfully updated.'
    else
      render 'edit'
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

  def set_user
    @user = User.find(params[:id])
  end
end
