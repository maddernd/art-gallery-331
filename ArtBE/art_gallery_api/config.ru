require_relative "config/environment"
require 'rack/contrib/try_static'
require 'logger'

logger = Logger.new(STDOUT)

use Rack::Deflater
use Rack::TryStatic,
  :root => "public",
  :urls => %w[/swagger],
  :try => ['.html', 'index.html', '/index.html']

use Rack::CommonLogger, logger

map '/' do
  run ArtGalleryApi::Application
end
