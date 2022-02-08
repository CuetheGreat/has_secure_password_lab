class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to login_path unless user
    @user = user
    session[:user_id] = @user.id
    redirect_to welcome_path
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

  private
end
