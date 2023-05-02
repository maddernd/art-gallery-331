module Entities
  class User < Grape::Entity
    expose :id
    expose :email
    expose :first_name
    expose :last_name
    expose :admin
    expose :password_digest
  end
end
