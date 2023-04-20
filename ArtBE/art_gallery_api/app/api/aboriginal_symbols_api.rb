require 'grape'
require 'grape-swagger'

class AboriginalSymbolsAPI < Grape::API
  format :json
  default_format :json

  resource :aboriginal_symbols do
    desc 'Return list of aboriginal symbols'
    get do
      present AboriginalSymbol.all, with: Entities::AboriginalSymbol
    end

    desc 'Return a specific aboriginal symbol'
    params do
      requires :id, type: Integer, desc: 'Aboriginal symbol ID'
    end
    get ':id' do
      present AboriginalSymbol.find(params[:id]), with: Entities::AboriginalSymbol
    end

    desc 'Create a new aboriginal symbol'
    params do
      requires :name, type: String, desc: 'Aboriginal symbol name'
      requires :description, type: String, desc: 'Aboriginal symbol description'
    end
    post do
      symbol = AboriginalSymbol.create!(name: params[:name], description: params[:description])
      present symbol, with: Entities::AboriginalSymbol
    end

    desc 'Update an aboriginal symbol'
    params do
      requires :id, type: Integer, desc: 'Aboriginal symbol ID'
      requires :name, type: String, desc: 'Aboriginal symbol name'
      requires :description, type: String, desc: 'Aboriginal symbol description'
    end
    put ':id' do
      symbol = AboriginalSymbol.find(params[:id])
      symbol.update(name: params[:name], description: params[:description])
      present symbol, with: Entities::AboriginalSymbol
    end

    desc 'Delete an aboriginal symbol'
    params do
      requires :id, type: Integer, desc: 'Aboriginal symbol ID'
    end
    delete ':id' do
      symbol = AboriginalSymbol.find(params[:id])
      symbol.destroy
    end
  end

  add_swagger_documentation(
    api_version: '1.0',
    base_path: '/api', 
    hide_documentation_path: true,
    info: {
      title: 'Aboriginal Symbols API',
      description: 'API for managing aboriginal symbols'
    }
  )
end

