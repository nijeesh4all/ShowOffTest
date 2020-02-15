module ApplicationHelper
  def current_user_resource?
    logged_in? &&
        params[:user_id] == 'me' ||
        (controller_name == 'users' && params[:id] == 'me') ||
        @user&.id == @current_user&.id
  end

  def profile_path?
    controller_name == 'users' and action_name == 'show'
  end

  def make_js_flashes(error, messages = [])
    messages = [messages] unless messages.is_a? Array
    fun_name = error ? 'error' : 'success'
    messages
        .map { |message| "Flash.#{fun_name}('#{j message}')" }
        .join(';')
        .html_safe
  end

end
