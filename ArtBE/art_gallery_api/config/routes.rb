require 'grape'
require_relative '../app/api/ApiRoot'

Rails.application.routes.draw do
  mount ApiRoot => '/'
  mount GrapeSwaggerRails::Engine, at: '/api/docs'
end
