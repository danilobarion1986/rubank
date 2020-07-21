# frozen_string_literal: true

# :no-doc:
module Rubank
  # Client to interact with Nubank's endpoints
  class Client
    class AuthenticationError < StandardError; end

    def authenticate(_username: nil, _password: nil)
      raise AuthenticationError, "Credentials are either wrong or missing!"
    end
  end
end
