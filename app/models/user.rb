class User < ShowoffRecord
  include Auth
  attr_accessor :id,:email,:name,:images,:first_name,:last_name,:date_of_birth,
                :password,:password_confirmation,
                :access_token, :refresh_token,:expires_in,:authentication_token_expires_at,
                :current_password,:new_password,:active
  def attributes
    {
        id: id,
        email: email,
        images: images,
        last_name: last_name,
        first_name: first_name
    }
  end

  def widgets
    ShowoffService::Widget.user_all(user_id: id)
  end

  def widgets_visible
    ShowoffService::Widget.user_all(user_id: id, visibility: 'visible')
  end

  def widgets_hidden
    ShowoffService::Widget.user_all(user_id: id, visibility: 'hidden')
  end

end