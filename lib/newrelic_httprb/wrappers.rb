module NewRelicHTTP
  HTTPResponse = NewRelic::Agent::HTTPClients::HTTPClientResponse

  class HTTPRequest
    attr_reader :request, :uri

    def initialize(request)
      @request = request
      @uri = request.uri
    end

    def type
      "http.rb"
    end

    def method
      request.verb
    end

    def host
      request.socket_host
    end

    def [](key)
      request.headers[key]
    end

    def []=(key, value)
      request.headers[key] = value
    end
  end
end
