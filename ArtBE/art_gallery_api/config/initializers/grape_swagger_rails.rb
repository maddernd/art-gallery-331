GrapeSwaggerRails.options.url = '/api/swagger_doc.json'
GrapeSwaggerRails.options.app_name = 'Art Gallery API'
GrapeSwaggerRails.options.doc_expansion = 'none'

GrapeSwaggerRails.options.app_css = '/stylesheets/grape_swagger_rails/application.css'
GrapeSwaggerRails.options.app_js = '/javascripts/grape_swagger_rails/application.js'

GrapeSwaggerRails.options.before_action do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
end
