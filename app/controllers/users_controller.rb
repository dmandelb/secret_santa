class UsersController < ApplicationController
  before_filter :ensure_authorization, only: [:show, :edit, :update]
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  def show
    @relationships = @user.bad_matches
  end

  def edit
  end

  def update
    if @user.authenticate(params[:user][:password]) && @user.update(user_params)
      redirect_to @user
    else
      redirect_to edit_user_path(params[:id])
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def ensure_authorization
    @user = User.find_by(id: params[:id])
    redirect_to root_path unless current_user == @user
  end
end
