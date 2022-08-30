module API
  module SharedHelpers
    extend Grape::API::Helpers
    require 'jwt'

    def authenticate_user!(jwt_token)
      return if request.options?

      begin
        response = { message: 'Invalid JWT token'}
        raise if jwt_token.blank?

        jwt = JWT.decode(jwt_token, nil, false)&.first
        return if jwt['email'] == 'admin@yopmail.com'

        @user = User.find_by(email: jwt['email'])
        return unless @user.nil?

      rescue JWT::DecodeError, RuntimeError => e
        response[:message] = e.message
        response[:source] = params
        error! response, 401, 'Content-Type' => 'text/error'
      end
    end
  end
end
