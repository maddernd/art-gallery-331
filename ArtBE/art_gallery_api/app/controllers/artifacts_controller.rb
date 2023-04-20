class Api::V1::ArtifactsController < ApplicationController
  before_action :authenticate
  before_action :set_artifact, only: [:show, :update, :destroy]

  def index
    @artifacts = Artifact.all
    render json: @artifacts
  end

  def show
    render json: @artifact
  end

  def create
    @artifact = Artifact.new(artifact_params)

    if @artifact.save
      render json: @artifact, status: :created
    else
      render json: @artifact.errors, status: :unprocessable_entity
    end
  end

  def update
    if @artifact.update(artifact_params)
      render json: @artifact
    else
      render json: @artifact.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @artifact.destroy
  end

  private

  def set_artifact
    @artifact = Artifact.find(params[:id])
  end

  def artifact_params
    params.require(:artifact).permit(:name, :description, :aboriginal_symbol_id, :art_type_id)
  end
end
