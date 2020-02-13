class ApplicationController < ActionController::Base
  layout 'application'
  protect_from_forgery unless: -> { request.format.json? }

  helper_method :current_user, :is_logged_in?

  def current_user
    @current_user ||= (session[:user] if session[:user].present?)
  end

  def set_session_and_user
    @session = Session.new
    @user = User.new
  end

  def set_session(user = current_user)
    session[:user] = user
  end

  def is_logged_in?
    current_user.present?
  end

  private

  def allow_unauthenticated_user_only
    if current_user.present?
      redirect_to root_path
    end
  end

  def authenticate_user
    if !is_logged_in? || current_user.expires_in > DateTime.now.to_i
      redirect_to login_path, notice: "Please Login in to continue"
    end
  end

end