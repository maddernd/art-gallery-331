class Api::V1::AboriginalSymbolsController < ApplicationController
  def index
    @aboriginal_symbols = AboriginalSymbol.all
    render json: @aboriginal_symbols
  end

  def show
    @aboriginal_symbol = AboriginalSymbol.find(params[:id])
    render json: @aboriginal_symbol
  end

  def create
    @aboriginal_symbol = AboriginalSymbol.create!(aboriginal_symbol_params)
    render json: @aboriginal_symbol
  end

  def update
    @aboriginal_symbol = AboriginalSymbol.find(params[:id])
    @aboriginal_symbol.update(aboriginal_symbol_params)
    render json: @aboriginal_symbol
  end

  def destroy
    @aboriginal_symbol = AboriginalSymbol.find(params[:id])
    @aboriginal_symbol.destroy
    head :no_content
  end

  private

  def aboriginal_symbol_params
    params.permit(:name, :description)
  end
end
