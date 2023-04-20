require 'grape'
require 'grape-swagger'
require_relative 'artists_api'
require_relative 'art_facts_api'
require_relative 'art_types_api'
require_relative 'artifacts_api'
require_relative 'users_api'
require_relative 'user_tokens'
require_relative 'aboriginal_symbols_api'

class ApiRoot < Grape::API
  prefix 'api'
  format :json
  
  before do
    header['Access-Control-Allow-Origin'] = '*'
    header['Access-Control-Request-Method'] = '*'
  end

  rescue_from :all do |e|
    case e
    when ActiveRecord::RecordInvalid, Grape::Exceptions::ValidationErrors, ActiveRecord::RecordNotDestroyed
      message = e.message
      status = 400
    when ActiveRecord::InvalidForeignKey
      message = "This operation has been rejected as it would break data integrity. Ensure that related values are deleted or updated before trying again."
      status = 400
    when Grape::Exceptions::MethodNotAllowed
      message = e.message
      status = 405
    when ActiveRecord::RecordNotFound
      message = "Unable to find requested #{e.message[/(Couldn't find )(.*)( with)/, 2]}"
      status = 404
    when ActionController::ParameterMissing
      message = "Missing value for #{e.param}"
      status = 400
    else
      logger.error "Unhandled exception: #{e.class}"
      logger.error e.inspect
      logger.error e.backtrace.join("\n")
      message = "Sorry... something went wrong with your request."
      status = 500
    end
    Rack::Response.new({ error: message }.to_json, status, { 'Content-type' => 'text/error' })
  end

  # Mount your API endpoints here
  mount ArtistsAPI
  mount ArtifactsAPI
  mount ArtFactsAPI
  mount ArtTypesAPI
  mount UsersAPI
  mount AboriginalSymbolsAPI
  mount UserTokens

  # Enable Swagger documentation
  add_swagger_documentation(
    hide_documentation_path: true,
    info: {
      title: 'Art Gallery API',
      description: 'This is a Grape API written by Daniel Maddern'
    },
    mount_path: '/api/docs',
    hide_format: true,
    include: [
      ArtistsAPI,
      ArtifactsAPI,
      ArtFactsAPI,
      ArtTypesAPI,
      UsersAPI,
      AboriginalSymbolsAPI,
      UserTokens
    ]
  )
end
