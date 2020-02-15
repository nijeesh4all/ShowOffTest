module Auth
  def authenticate
    response, status = ShowoffClient::Request.post_json('/oauth/token',{
        "grant_type": "password",
        "username": email,
        "password": password
    })
    if status == 200
      set_auth_tokens response["data"]["token"]
      self.attributes = User.find('me').attributes
    end
    self
  end

  def revoke_token
    response, status = ShowoffClient::Request.post_json('/oauth/revoke',{
        "token": self.access_token,
    })
    puts response
    if status == 200
      self.access_token = self.refresh_token = nil
      ShowoffClient::Connection.revoke_token
    end
    self
  end

  def refresh_token
    response, status = ShowoffClient::Request.post_json('/oauth/token',{
        "grant_type": "refresh_token",
        "refresh_token": refresh_token,
    })
    if status == 200
      set_auth_tokens response["data"]["token"]
    end
    self
  end

  def set_auth_tokens token
    self.access_token = token["access_token"]
    self.refresh_token = token["refresh_token"]
    self.expires_in = token["expires_in"]
    self.authentication_token_expires_at = self.created_at + self.expires_in
    ShowoffClient::Connection.set_token self.access_token
  end

  def token_expired?
    self.authentication_token_expires_at < DateTime.no.to_i
  end
end
