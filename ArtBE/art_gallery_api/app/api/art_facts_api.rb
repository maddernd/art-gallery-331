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
      requires :description, type: String, desc: 'Art fact description'
      optional :image_url, type: String, desc: 'Art fact image URL'
    end
    post do
      ArtFact.create!(title: params[:title], description: params[:description], image_url: params[:image_url])
    end

    desc 'Update an art fact'
    params do
      requires :id, type: Integer, desc: 'Art fact ID'
      requires :title, type: String, desc: 'Art fact title'
      requires :description, type: String, desc: 'Art fact description'
      optional :image_url, type: String, desc: 'Art fact image URL'
    end
    put ':id' do
      art_fact = ArtFact.find(params[:id])
      art_fact.update(title: params[:title], description: params[:description], image_url: params[:image_url])
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
end
