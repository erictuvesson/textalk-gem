# frozen_string_literal: true

module Textalk
  class Order < Model
    class << self
      def list(params)
        handle_response Request.new(method: "Order.list", params: params).run
      end

      def get(params)
        handle_response Request.new(method: "Order.get", params: params).run
      end
    end
  end
end
