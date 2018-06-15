# frozen_string_literal: true

module Textalk
  class Request
    def initialize(method: nil, params: {})
      @body = {
        jsonrpc: "2.0",
        method: method,
        params: params,
        id: 1
      }

      @connection = Faraday.new(url: Textalk.build_url) do |faraday|
        faraday.request  :url_encoded
        # faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end

    def run
      @connection.post do |req|
        req.headers["Content-Type"] = "application/json"
        req.body = @body.to_json
      end
    end
  end
end
