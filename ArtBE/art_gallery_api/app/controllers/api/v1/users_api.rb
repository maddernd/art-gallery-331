# app/controllers/api/v1/users.rb
module API
  module V1
    class Users < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :users do
        desc 'Return list of users'
        get do
          authenticate!
          User.all
        end

        desc 'Return a specific user'
        params do
          requires :id, type: Integer, desc: 'User ID'
        end
        get ':id' do
          authenticate!
          User.find(params[:id])
        end

        desc 'Create a new user'
        params do
          requires :name, type: String, desc: 'User name'
          requires :email, type: String, desc: 'User email'
          requires :password, type: String, desc: 'User password'
        end
        post do
          User.create!(name: params[:name], email: params[:email], password: params[:password])
        end

        desc 'Update a user'
        params do
          requires :id, type: Integer, desc: 'User ID'
          requires :name, type: String, desc: 'User name'
          requires :email, type: String, desc: 'User email'
          optional :password, type: String, desc: 'User password'
        end
        put ':id' do
          authenticate!
          user = User.find(params[:id])
          user.update(name: params[:name], email: params[:email], password: params[:password])
          user
        end

        desc 'Delete a user'
        params do
          requires :id, type: Integer, desc: 'User ID'
        end
        delete ':id' do
          authenticate!
          user = User.find(params[:id])
          user.destroy
        end

        desc 'Authenticate user'
        params do
          requires :email, type: String, desc: 'User email'
          requires :password, type: String, desc: 'User password'
        end
        post '/authenticate' do
          user = User.find_by(email: params[:email])
          if user && user.authenticate(params[:password])
            token = JwtService.encode({ user_id: user.id })
            { token: token }
          else
            error!('Unauthorized.', 401)
          end
        end
      end
    end
  end
end
