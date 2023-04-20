class Api::V1::ArtFactsController < ApplicationController
  before_action :set_art_fact, only: [:show, :update, :destroy]

  def index
    @art_facts = ArtFact.all
    render json: @art_facts
  end

  def show
    render json: @art_fact
  end

  def create
    @art_fact = ArtFact.create!(art_fact_params)
    render json: @art_fact, status: :created
  end

  def update
    @art_fact.update(art_fact_params)
    render json: @art_fact
  end

  def destroy
    @art_fact.destroy
    head :no_content
  end

  private

  def set_art_fact
    @art_fact = ArtFact.find(params[:id])
  end

  def art_fact_params
    params.require(:art_fact).permit(:title, :description)
  end
end
