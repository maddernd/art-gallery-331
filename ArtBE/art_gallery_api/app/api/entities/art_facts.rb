module Entities
  class ArtFact < Grape::Entity
    expose :id
    expose :title
    expose :description
    expose :image_url
  end
end
