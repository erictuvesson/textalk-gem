# frozen_string_literal: true

module Textalk
  module Order
    def list(params)
      Request.new(method: "Order.list", params: params).run
    end

    def get(params)
      Request.new(method: "Order.get", params: params).run
    end

    extend self
  end
end
