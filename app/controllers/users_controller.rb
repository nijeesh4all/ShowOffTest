class UsersController < ApplicationController
  before_action :authenticate_user, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update,:edit_passwords, :update_passwords ]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.create!
    @error = @user.errors.any?
    @messages = @error ? @user.errors.full_messages : ["User Successfully created"]
    set_session @user unless @error
  end

  def edit
    add_breadcrumb "PROFILE", user_path('me')
  end

  def update
    @user.update! user_update_params
    set_session @user, merge: true
    redirect_to user_path('me')
  end

  def edit_passwords
    add_breadcrumb "PROFILE", user_path('me')
  end

  def update_passwords
    @user.attributes = password_params
    @user.update_password!
    if @user.errors.any?
      flash.now[:notice] =  @user.errors.full_messages
      render :edit_passwords
    else
      flash[:success] = "Password successfully updated"
      redirect_to user_path 'me'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :image_url)
  end

  def user_update_params
    params.require(:user).permit(:first_name, :last_name, :image_url, :date_of_birth)
  end

  def update_password_params

  end

  def set_user
    @user = User.find(params[:id] || params[:user_id])
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end

end
