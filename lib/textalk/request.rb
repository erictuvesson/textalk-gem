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

      @connection = Faraday.new(url: Request.create_endpoint) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger if Textalk.debug
        faraday.adapter  Faraday.default_adapter
      end
    end

    def run
      @connection.post do |req|
        req.headers["Content-Type"] = "application/json"
        req.body = @body.to_json
      end
    end

    def self.create_endpoint
      raise "Missing endpoint" unless Textalk.endpoint
      raise "Missing webshop id" unless Textalk.webshop_id
      raise "Missing api key" unless Textalk.api_key
      "#{Textalk.endpoint}?webshop=#{Textalk.webshop_id}&auth=#{Textalk.api_key}"
    end
  end
end
