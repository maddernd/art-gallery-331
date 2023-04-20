class UserTokensController < ApplicationController
    def create
      user = User.find_by(email: params[:email])
  
      if user&.authenticate(params[:password])
        token = user.user_tokens.create!(token: JwtService.encode(user_id: user.id))
        render json: { token: token.token }
      else
        head :unauthorized
      end
    end
  
    def destroy
      user_token = UserToken.find_by(token: request.headers['Authorization']&.split&.last)
      user_token&.destroy
      head :no_content
    end
  end
  