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

  def auth_attributes
    {
        last_name: last_name,
        first_name: first_name,
        id: id,
        email: email,
        access_token: access_token,
        refresh_token: refresh_token,
        expires_in:expires_in,
        authentication_token_expires_at: authentication_token_expires_at
    }
  end

end