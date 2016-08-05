class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email:  params[:email])

    if @user.authenticate(params[:password])
      session[:user_id] = @user.id # Actually log in
      redirect_to user_home_path(:user_id)
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
