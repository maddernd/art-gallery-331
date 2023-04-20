require 'rack/cors'
require_relative "boot"
require "rails/all"
require 'grape-swagger-rails'
require 'grape'

Bundler.require(*Rails.groups)

module ArtGalleryApi
  class Application < Rails::Application
    config.load_defaults 7.0
    config.api_only = true
    config.swagger_ui_url = '/api/docs'
    config.middleware.insert_before ActionDispatch::Static, Rack::Cors do
      allow do
        origins 'localhost:3000', '127.0.0.1:3000'
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options], credentials: true
      end
    end

    config.autoload_paths << "#{Rails.root}/app/helpers"
    config.to_prepare do
      Dir.glob(Rails.root.join('app/helpers/**/*.rb')).each do |file|
        require_dependency file
      end
    end
  end
end
