# app/controllers/api/base.rb
module API
    class Base < Grape::API
      mount API::V1::Artists
      # Mount other APIs for the remaining contexts here
    end
  end
  