module Entities
  class Artifact < Grape::Entity
    expose :id
    expose :name
    expose :description
    expose :image_url
    expose :artist_id
    expose :art_type_id
  end
end
