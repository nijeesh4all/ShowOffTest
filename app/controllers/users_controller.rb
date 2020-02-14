class UsersController < ApplicationController
  before_action :authenticate_user, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update]

  def show
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.create!
    @error = !@user.valid?
    @message = @error ? @user.errors : "User Successfully created"
    set_session @user unless @error
  end

  def edit
  end

  def update
    @user.update! user_update_params
    set_session @user
    redirect_to user_path('me')
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :image_url)
  end

  def user_update_params
    params.require(:user).permit(:first_name, :last_name, :image_url, :date_of_birth)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
