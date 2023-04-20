require 'grape-swagger'

module API
  class Base < Grape::API
    format :json
    prefix 'api'

    # Mount your API endpoints here
    mount API::V1::Artists
    mount API::V1::Artifacts
    mount API::V1::ArtFacts
    mount API::V1::Users
    mount API::V1::AboriginalSymbols

    # Enable Swagger documentation
    add_swagger_documentation(
      hide_documentation_path: true,
      api_version: 'v1',
      info: {
        title: 'Art Gallery API',
        description: 'This is a grape API writen by Daniel maddern'
      }
    )
  end
end
