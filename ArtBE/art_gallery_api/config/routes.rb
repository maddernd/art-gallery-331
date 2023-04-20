require 'grape'
#require_relative '../app/api/ApiRoot'

ArtGalleryApi::Application.routes.draw do
  mount ApiRoot => '/'
  mount GrapeSwaggerRails::Engine => '/swagger'
  #get '/swagger' => redirect('/swagger/index.html')
  #get '/swagger/*path', to: 'grape_swagger_rails/application#serve'
end
