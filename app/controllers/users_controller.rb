class UsersController < ApplicationController
  before_action :authenticate_user, except: [:new, :create]
  before_action :set_user, only: [:show]

  def show
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.create!
    @error = !@user.valid?
    @message = @error ? @user.errors : "User Successfuly created"
    set_session @user unless @error
  end

  def edit

  end

  def update

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :image_url)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
