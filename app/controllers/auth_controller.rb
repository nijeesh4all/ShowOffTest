class AuthController < ApplicationController

  before_action :allow_unauthenticated_user_only, only: [:new, :create, :edit, :update]
  before_action :authenticate_user, only: [:destroy]

  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    if params[:commit] == 'Login'
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

      partial = 'create'

    else
      response = ShowoffService::User.check_email params[:email]
      partial = 'check_email'
      @error = response["data"]["available"]
    end

    respond_to do |format|
      format.js { render partial: partial }
    end

  end

  def edit

  end

  def update
    response = ShowoffService::User.reset_password(params[:email])
    @message = response["message"]
    @error = response["code"] != 0
  end

  def destroy
    purge_session
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
