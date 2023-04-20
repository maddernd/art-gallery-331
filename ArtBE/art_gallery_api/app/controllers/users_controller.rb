# app/controllers/api/v1/users_controller.rb
class Api::V1::UsersController < ApplicationController
  before_action :authenticate!, except: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.create!(user_params)
    token = JwtService.encode({ user_id: @user.id })
    render json: { user: @user, token: token }, status: :created, location: @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
