module AuthenticationHelper
  def authenticate!
    begin
      # Extract the token from the Authorization header
      token = request.headers['Authorization'].split(' ').last
      
      # Verify the token using the secret key
      decoded_token = JWT.decode(token, secret_key, true, { algorithm: 'HS256' })
      
      # Set the current user based on the token payload
      @current_user = User.find(decoded_token[0]['user_id'])
    rescue JWT::DecodeError
      error!('Unauthorized', 401)
    end
  end

  def current_user
    @current_user
  end

  def secret_key
    Rails.application.secrets.secret_key_base
  end
end
