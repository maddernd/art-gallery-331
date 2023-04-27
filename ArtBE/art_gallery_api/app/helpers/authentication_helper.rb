module AuthenticationHelper
  def current_user
    begin
      # Extract the token from the Authorization header
      token = request.headers['Authorization'].split(' ').last
      puts "Token: #{token}"

      # Verify the token using the secret key
      decoded_token = JWT.decode(token, secret_key, true, { algorithm: 'HS256' })
      puts "Decoded token: #{decoded_token.inspect}"

      # Set the current user based on the token payload
      @current_user = User.find(decoded_token[0]['user_id'])
    rescue JWT::DecodeError => e
      puts "JWT decode error: #{e.message}"
      nil
    end
  end

  def secret_key
    Rails.application.secrets.secret_key_base
  end
end
