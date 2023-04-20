require 'api/base'
require 'api/v1/art_types'
require 'api/v1/artists'
require 'api/v1/artifacts'
require 'api/v1/art_facts'
require 'api/v1/users'
require 'api/v1/aboriginal_symbols'
require 'grape-swagger'

Rails.application.routes.draw do
  mount API::Base => '/api'
end