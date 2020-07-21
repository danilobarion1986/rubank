module Rubank
  class Client
    class AuthenticationError < StandardError; end

    def authenticate(username: nil, password: nil)
      raise AuthenticationError, "Credentials are either wrong or missing!"
    end
  end
end
