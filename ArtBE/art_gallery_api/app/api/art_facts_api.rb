require 'grape'
require 'grape-swagger'

class ArtFactsAPI < Grape::API
  format :json
  default_format :json
  
  resource :art_facts do
    desc 'Return list of art facts'
    get do
      ArtFact.all
    end

    desc 'Return a specific art fact'
    params do
      requires :id, type: Integer, desc: 'Art fact ID'
    end
    get ':id' do
      ArtFact.find(params[:id])
    end

    desc 'Create a new art fact'
    params do
      requires :title, type: String, desc: 'Art fact title'
      optional :description, type: String, desc: 'Art fact description'
    end
    post do
      ArtFact.create!(title: params[:title], description: params[:description])
    end

    desc 'Update an art fact'
    params do
      requires :id, type: Integer, desc: 'Art fact ID'
      requires :title, type: String, desc: 'Art fact title'
      optional :description, type: String, desc: 'Art fact description'
    end
    put ':id' do
      art_fact = ArtFact.find(params[:id])
      art_fact.update(title: params[:title], description: params[:description])
      art_fact
    end

    desc 'Delete an art fact'
    params do
      requires :id, type: Integer, desc: 'Art fact ID'
    end
    delete ':id' do
      art_fact = ArtFact.find(params[:id])
      art_fact.destroy
    end
  end
  add_swagger_documentation(
    api_version: '1.0',
    base_path: '/api', 
    hide_documentation_path: true,
    info: {
      title: 'Art Facts',
      description: 'API for managing Art Facts'
    }
  )
end
