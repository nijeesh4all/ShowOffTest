class AuthController < ApplicationController

  before_action :allow_unauthenticated_user_only

  def index
    respond_to do |format|
      format.js
    end
  end

  def new
  end

  def create
    user = User.new(login_params)
    user.authenticate
    if user.access_token
      set_session(user)
      @message = "Logged In"
      @error = false
    else
      @message = "Check Username & password combination"
      @error = true
    end

    respond_to do |format|
      format.js
    end
  end

  def destroy
    set_session(nil)
    redirect_to root_path
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
