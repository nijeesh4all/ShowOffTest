module ShowoffService
  class User < Base

    def self.create(attributes)
      attributes.delete(:id) if attributes.has_key?(:id)
      url = 'users'
      response, status = ShowoffClient::Request.post_json(url, {user: attributes})
      return response
    end

    def self.update(attributes)
      attributes.delete(:id) if attributes.has_key?(:id)
      url = 'users/me'
      response, status = ShowoffClient::Request.put_json(url, {user: attributes})
      return response
    end

    def self.find(user_id)
      url = "users/#{user_id}"
      response, status = ShowoffClient::Request.get_json(url)
      return response unless status != 200
    end

    def self.reset_password(email)
      url = "users/reset_password"
      response, status = ShowoffClient::Request.post_json(url, {user: {email: email}})
      return response
    end

    def self.check_email(email)
      url = 'users/email'
      response, status = ShowoffClient::Request.get_json(url, {email: email })
      return response unless status != 200
    end

    def self.update_password(current_password, new_password)
      url = 'users/me/password'
      params = {current_password: current_password,new_password: new_password  }
      response, status = ShowoffClient::Request.post_json(url, user: params)
      return response unless status != 200
    end

  end
end
