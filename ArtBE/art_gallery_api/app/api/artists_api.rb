require 'grape'
require 'grape-swagger'

class ArtistsAPI < Grape::API
  format :json
  default_format :json
  
  resource :artists do
    desc 'Return list of artists'
    get do
      Artist.all
    end

    desc 'Return a specific artist'
    params do
      requires :id, type: Integer, desc: 'Artist ID'
    end
    get ':id' do
      Artist.find(params[:id])
    end

    desc 'Create a new artist'
    params do
      requires :name, type: String, desc: 'Artist name'
      optional :bio, type: String, desc: 'Artist bio'
    end
    post do
      Artist.create!(name: params[:name], bio: params[:bio])
    end

    desc 'Update an artist'
    params do
      requires :id, type: Integer, desc: 'Artist ID'
      requires :name, type: String, desc: 'Artist name'
      optional :bio, type: String, desc: 'Artist bio'
    end
    put ':id' do
      artist = Artist.find(params[:id])
      artist.update(name: params[:name], bio: params[:bio])
      artist
    end

    desc 'Delete an artist'
    params do
      requires :id, type: Integer, desc: 'Artist ID'
    end
    delete ':id' do
      artist = Artist.find(params[:id])
      artist.destroy
    end
  end
end
