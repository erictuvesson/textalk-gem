# frozen_string_literal: true

module Textalk
  class Model
    def initialize(variables)
      @variables = variables.deep_symbolize_keys
    end

    def uid
      @variables.dig(:uid)
    end

    def [](sym)
      @variables.dig(sym)
    end  

    class << self
      def create_request(method, params, object: nil)
        resp = handle_response Request.new(method: method, params: params).run
        return resp if resp.nil? || object.nil?
        return resp.map { |obj| object.new obj } if resp.is_a?(Array)
        object.new(resp)
      end

      def handle_response(response)
        resp = JSON.parse(response.body)
        raise resp["error"]["message"] if resp["error"]
        resp["result"]
      end
    end
  end
end
