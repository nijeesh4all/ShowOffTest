class User < ShowoffRecord
  include Auth

  attr_accessor :id, :email, :name, :images, :first_name, :last_name, :date_of_birth,
                :password, :password_confirmation, :image_url,
                :access_token, :refresh_token, :expires_in, :authentication_token_expires_at,
                :current_password, :new_password, :active

  def attributes
    {
        id: id,
        email: email,
        last_name: last_name,
        first_name: first_name,
        image_url: image_url,
        password: password,
        date_of_birth: date_of_birth
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
        expires_in: expires_in,
        authentication_token_expires_at: authentication_token_expires_at
    }
  end

  def create!
    response = ShowoffService::User.create attributes
    if response["code"] != 0
      self.errors = response["message"]
    else
      set_auth_tokens response["data"]["token"]
    end
    self
  end


  def update!(attr)
    response = ShowoffService::User.update attr
    if response["code"] != 0
      self.errors = response["message"]
    end
    self
  end

  def update_password!(current_password, new_password)
    response = ShowoffService::User.update_password current_password, new_password
    if response.nil? || ( response.present? && response["code"] != 0 )
      self.errors = "Invalid Password, please enter again"
    else
      set_auth_tokens response["data"]["token"]
    end
    self
  end

  def full_name
    name || "#{first_name}  #{last_name}"
  end

  def self.find(id)
    response = ShowoffService::User.find(id)
    raise RecordNotFound if response.nil?
    User.new response["data"]["user"]
  end

end