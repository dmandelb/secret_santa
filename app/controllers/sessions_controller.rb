class SessionsController < ApplicationController
  def login
  end

  def create
    user = User.find_by(email: params[:email])
    binding.pry
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end
end
