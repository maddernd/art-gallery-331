module Entities
  class Artist < Grape::Entity
    expose :id
    expose :name
    expose :bio
    expose :image_url
  end
end
