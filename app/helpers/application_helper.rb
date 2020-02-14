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

end
