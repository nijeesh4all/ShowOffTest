module ShowoffService
  class User < Base

    def self.create(attributes)
      url = 'users'
      response, status = ShowoffClient::Request.post_json(url, {user: attributes})
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
      return response unless status != 200
    end

    def self.check_email(email)
      url = 'users/email'
      response, status = ShowoffClient::Request.get_json(url, {email: email })
      return response unless status != 200
    end

  end
end
