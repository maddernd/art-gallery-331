require 'rack/cors'
require_relative "boot"
require "rails/all"
require 'grape-swagger-rails'
require 'grape'

# Precompile assets before deploying to production
if defined?(Bundler)
  Bundler.require(*Rails.groups(assets: %w(development test)))
end

module ArtGalleryApi
  class Application < Rails::Application
    config.load_defaults 7.0
    config.api_only = true
    config.autoload_paths << Rails.root.join('app/helpers')

    # config.paths.add 'app/api', glob: '**/*.rb'
    # config.autoload_paths += Dir["#{Rails.root}/app"]
    # config.autoload_paths += Dir[Rails.root.join("app", "models", "{*/}")]
    config.eager_load_paths << Rails.root.join('app') << Rails.root.join('app', 'models', 'comments')
    config.middleware.insert_before ActionDispatch::Static, Rack::Cors do
      allow do
        origins 'localhost:3000', '127.0.0.1:3000'
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options], credentials: true
      end
    end
  end
end
