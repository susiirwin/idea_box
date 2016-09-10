class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:sessions][:username])
    if @user && @user.authenticate(params[:sessions][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:error] = "Invalid. Try Again."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Later! Thanks for the Great Ideas!"
    redirect_to login_path
  end
end
