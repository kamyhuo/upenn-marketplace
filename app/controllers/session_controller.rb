class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if !@user.nil? && (@user.password == params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to '/login'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
