class User < ShowoffRecord
  include Auth

  attr_accessor :id, :email, :name, :images, :first_name, :last_name, :date_of_birth,
                :password, :password_confirmation, :image_url,
                :access_token, :refresh_token, :expires_in, :authentication_token_expires_at,
                :current_password, :active

  validates_length_of :password, minimum: 8, on: [:create_user, :update_password]
  validates_presence_of :email, :first_name, :last_name, :password, :password_confirmation, on: :create_user
  validate :passwords_equality, on: [:create_user, :update_password]
  validates_presence_of :first_name, :last_name, :date_of_birth, on: :update_user

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
    return self unless valid?(:create_user)
    response = ShowoffService::User.create attributes
    if response["code"] != 0
      self.errors.add :base, response["message"]
    else
      set_auth_tokens response["data"]["token"]
    end
    self
  end


  def update!(attr)
    self.attributes = attr
    return self unless valid?(:update_user)
    response = ShowoffService::User.update attr
    if response["code"] != 0
      self.errors.add :base, response["message"]
    end
    self
  end

  def update_password!
    return self unless valid?(:update_password)
    response = ShowoffService::User.update_password current_password, password
    if response.nil? || (response.present? && response["code"] != 0)
      self.errors.add :base, "Invalid Password, please enter again"
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

  private

  def passwords_equality
    errors.add(:password_confirmation,
               "Passwords doesnt match") unless password == password_confirmation
  end

end