module Entities
  class Artist < Grape::Entity
    expose :id
    expose :name
    expose :bio
  end
end
