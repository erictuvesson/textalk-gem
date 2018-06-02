# frozen_string_literal: true

module Textalk
  module Order
    def list(params)
      Request.new(method: "Order.list", params: params).run
    end

    def get(params)
      Request.new(method: "Order.get", params: params).run
    end

    def create(event_name, url)
      data = {
        authToken: Textalk.api_key,
        eventName: event_name,
        url: url
      }
      handle_resp Request.new(method: "EventListener.create", params: [data, ["uid", "status"]]).run
    end

    private

    def handle_resp(resp)
      JSON.parse resp.body["result"]
    end

    extend self
  end
end
