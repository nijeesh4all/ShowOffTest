class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  helper_method :current_user, :logged_in?
  before_action :refresh_token_if_expired

  add_breadcrumb "HOME", :root_path

  def current_user
    @current_user ||= (User.new(session[:user]) if session[:user].present?)
  end

  def set_session_and_user
    @session = Session.new
    @user = User.new
  end

  def set_session(user = current_user, merge: false)
    if !merge || session[:user].nil?
      session[:user] = user.auth_attributes
    else
      session[:user].merge! user.auth_attributes.compact
    end
  end

  def purge_session
    current_user.revoke_token if logged_in?
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
    redirect_to root_path, notice: "Please Login in to continue" unless logged_in?
  end

  def refresh_token_if_expired
    current_user.refresh_token if logged_in? && current_user.token_expired?
  end

  rescue_from 'ShowoffClient::Error::UnauthorisedAccess' do |exception|
    authenticate_user
  end

  rescue_from 'ShowoffClient::Error::UnprocessableRequest' do |exception|
    respond_to_error 'unprocessable request', :unprocessable_entity
  end

  rescue_from 'ShowoffClient::Error::RecordNotFound' do |exception|
    respond_to_error 'Record not found', :not_found
  end

  def respond_to_error(message, status)
    respond_to do |format|
      format.js { render "Flash.error('#{message}')", status: status }
      format.json { render "{error: true, message: \"#{message}\"  }", status: status }
      format.html { render text: message, status: status }
    end
  end

end