require_relative "config/environment"
require 'rack/contrib/try_static'

use Rack::Deflater
use Rack::TryStatic,
  :root => "public",
  :urls => %w[/swagger],
  :try => ['.html', 'index.html', '/index.html']

  map '/' do
    run ArtGalleryApi::Application
  end
