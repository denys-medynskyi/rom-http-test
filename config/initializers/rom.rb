class RequestHandler
  def call(dataset)
    uri = dataset.uri

    path = "/#{dataset.name}/#{dataset.path}"

    client = Faraday.new(uri, headers: dataset.headers)

    client.send(dataset.request_method, path, dataset.params)
  end
end

class ResponseHandler
  def call(response, dataset)
    Array([JSON.parse(response.body)]).flatten
  end
end

ROM::Rails::Railtie.configure do |config|
  config.gateways[:default] = [:http, { uri: 'http://localhost:4000',
                                        headers: { Accept: "application/json" },
                                        request_handler: RequestHandler.new,
                                        response_handler: ResponseHandler.new }]
end