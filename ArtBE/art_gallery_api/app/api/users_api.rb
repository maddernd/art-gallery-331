require 'grape'
require 'grape-swagger'

class UsersAPI < Grape::API
  format :json
  default_format :json
  
  resource :users do
    desc 'Return list of users'
    get do
      begin
        users = User.all
        puts "Users fetched: #{users.count}"
        response = present users, with: Entities::User
        puts "Response: #{response}"
        response
      rescue => e
        puts "Error: #{e.message}"
        error!({ error: 'An error occurred while fetching users', message: e.message }, 500)
      end
    end
    
    
    

    desc 'Return a specific user'
    params do
      requires :id, type: Integer, desc: 'User ID'
    end
    get ':id' do
      present User.find(params[:id]), with: Entities::User
    end

    desc 'Create a new user'
    params do
      requires :email, type: String, desc: 'User email'
      requires :first_name, type: String, desc: 'User first name'
      requires :last_name, type: String, desc: 'User last name'
      requires :password, type: String, desc: 'User password'
    end
    post do
      password_digest = BCrypt::Password.create(params[:password])
      User.create!(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], password_digest: password_digest)
    end

    

    desc 'Update a user'
    params do
      requires :id, type: Integer, desc: 'User ID'
      requires :email, type: String, desc: 'User email'
      requires :first_name, type: String, desc: 'User first name'
      requires :last_name, type: String, desc: 'User last name'
      optional :password, type: String, desc: 'User password'
    end
    put ':id' do
      user = User.find(params[:id])
      user.update(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], password: params[:password])
      present user, with: Entities::User
    end

    desc 'Delete a user'
    params do
      requires :id, type: Integer, desc: 'User ID'
    end
    delete ':id' do
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
