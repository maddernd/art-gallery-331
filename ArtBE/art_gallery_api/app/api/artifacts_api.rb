require 'grape'

class ArtifactsAPI < Grape::API

  resource :artifacts do
    desc 'Return list of artifacts'
    get do
      Artifact.all
    end

    desc 'Return a specific artifact'
    params do
      requires :id, type: Integer, desc: 'Artifact ID'
    end
    get ':id' do
      Artifact.find(params[:id])
    end

    desc 'Create a new artifact'
    params do
      requires :name, type: String, desc: 'Artifact name'
      requires :description, type: String, desc: 'Artifact description'
      optional :aboriginal_symbol_id, type: Integer, desc: 'Aboriginal Symbol ID'
      requires :art_type_id, type: Integer, desc: 'Art Type ID'
    end
    post do
      Artifact.create!(name: params[:name], description: params[:description], aboriginal_symbol_id: params[:aboriginal_symbol_id], art_type_id: params[:art_type_id])
    end

    desc 'Update an artifact'
    params do
      requires :id, type: Integer, desc: 'Artifact ID'
      requires :name, type: String, desc: 'Artifact name'
      requires :description, type: String, desc: 'Artifact description'
      optional :aboriginal_symbol_id, type: Integer, desc: 'Aboriginal Symbol ID'
      requires :art_type_id, type: Integer, desc: 'Art Type ID'
    end
    put ':id' do
      artifact = Artifact.find(params[:id])
      artifact.update(name: params[:name], description: params[:description], aboriginal_symbol_id: params[:aboriginal_symbol_id], art_type_id: params[:art_type_id])
      artifact
    end

    desc 'Delete an artifact'
    params do
      requires :id, type: Integer, desc: 'Artifact ID'
    end
    delete ':id' do
      artifact = Artifact.find(params[:id])
      artifact.destroy
    end
  end
end
