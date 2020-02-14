module ShowoffService
  class User < Base

    def self.create(attributes)
      url = 'users'
      response, status = ShowoffClient::Request.post_json(url, {user: attributes})
      return response unless response[:error]
    end

    def self.find(user_id)
      url = "users/#{user_id}"
      response, status = ShowoffClient::Request.get_json(url)
      return response unless response[:error]
    end

    def self.reset_password(email)
      url = "users/reset_password"
      response, status = ShowoffClient::Request.post_json(url, {user: {email: email}})
      return response unless response[:error]
    end

  end
end
