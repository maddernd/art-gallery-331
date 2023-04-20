module Entities
  class ArtType < Grape::Entity
    expose :id
    expose :name
    expose :description
  end
end
