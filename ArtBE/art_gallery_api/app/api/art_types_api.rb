require 'grape'

class ArtTypesAPI < Grape::API

  resource :art_types do
    desc 'Return list of art types'
    get do
      ArtType.all
    end

    desc 'Return a specific art type'
    params do
      requires :id, type: Integer, desc: 'Art Type ID'
    end
    get ':id' do
      ArtType.find(params[:id])
    end

    desc 'Create a new art type'
    params do
      requires :name, type: String, desc: 'Art Type name'
    end
    post do
      ArtType.create!(name: params[:name])
    end

    desc 'Update an art type'
    params do
      requires :id, type: Integer, desc: 'Art Type ID'
      requires :name, type: String, desc: 'Art Type name'
    end
    put ':id' do
      art_type = ArtType.find(params[:id])
      art_type.update(name: params[:name])
      art_type
    end

    desc 'Delete an art type'
    params do
      requires :id, type: Integer, desc: 'Art Type ID'
    end
    delete ':id' do
      art_type = ArtType.find(params[:id])
      art_type.destroy
    end
  end
end
