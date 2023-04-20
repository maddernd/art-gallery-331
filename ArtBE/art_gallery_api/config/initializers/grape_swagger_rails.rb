# config/initializers/grape_swagger_rails.rb
GrapeSwaggerRails.options.url = '/api/swagger_doc.json'
GrapeSwaggerRails.options.app_name = 'Art Gallery API'
GrapeSwaggerRails.options.doc_expansion = 'none'
GrapeSwaggerRails.options.before_action do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
end

GrapeSwaggerRails.options.before_filter_proc = proc {
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
}
