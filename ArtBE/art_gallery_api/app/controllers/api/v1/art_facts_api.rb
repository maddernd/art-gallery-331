# app/controllers/api/v1/art_facts.rb
module API
    module V1
      class ArtFacts < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api
    
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
      end
    end
  end
  