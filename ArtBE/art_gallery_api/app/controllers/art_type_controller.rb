class Api::V1::ArtTypesController < ApplicationController
    before_action :authenticate
    before_action :set_art_type, only: [:show, :update, :destroy]
  
    def index
      @art_types = ArtType.all
      render json: @art_types
    end
  
    def show
      render json: @art_type
    end
  
    def create
      @art_type = ArtType.new(art_type_params)
  
      if @art_type.save
        render json: @art_type, status: :created
      else
        render json: @art_type.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @art_type.update(art_type_params)
        render json: @art_type
      else
        render json: @art_type.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @art_type.destroy
    end
  
    private
  
    def set_art_type
      @art_type = ArtType.find(params[:id])
    end
  
    def art_type_params
      params.require(:art_type).permit(:name)
    end
  end
  