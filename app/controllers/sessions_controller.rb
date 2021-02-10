def create
  @user = User.find_by(username: params[:username])

  if !!@user && @user.authenticate(params[:password])
    session[:user_id] = @user.id 
    redirect_to user_path
  else
    message = 'Something went wrong, make sure your username or User ID is correct'
    redirect_to login_path, notice: message
  end
end