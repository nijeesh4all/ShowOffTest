class ApplicationController < ActionController::Base
  layout 'application'
  protect_from_forgery unless: -> { request.format.json? }

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= (User.new(session[:user]) if session[:user].present?)
  end

  def set_session_and_user
    @session = Session.new
    @user = User.new
  end

  def set_session(user = current_user)
    session[:user] = user.auth_attributes
  end

  def purge_session
    current_user.revoke if logged_in?
    session.clear
  end

  def logged_in?
    current_user.present?
  end

  private

  def allow_unauthenticated_user_only
    redirect_to root_path if current_user.present?
  end

  def authenticate_user
    redirect_to login_path, notice: "Please Login in to continue" unless logged_in?
  end

end