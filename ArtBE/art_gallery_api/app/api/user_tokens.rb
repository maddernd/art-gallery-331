require 'grape'

class UserTokens < Grape::API

  resource :user_tokens do
    desc 'Create a new user token (login)'
    params do
      requires :email, type: String, desc: 'User email'
      requires :password, type: String, desc: 'User password'
    end
    post do
      user = User.find_by(email: params[:email])

      if user&.authenticate(params[:password])
        token = user.user_tokens.create!(token: JwtService.encode(user_id: user.id))
        { token: token.token }
      else
        error!('Unauthorized', 401)
      end
    end

    desc 'Destroy a user token (logout)'
    delete do
      user_token = UserToken.find_by(token: headers['Authorization']&.split&.last)
      user_token&.destroy
      status 204
    end
  end
end
