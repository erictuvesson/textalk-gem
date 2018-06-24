# frozen_string_literal: true

module Textalk
  class Order < Model
    class << self
      def get(uid, selection = true)
        create_request("Order.get", [uid, selection], object: Order)
      end

      def list(query = {}, selection = true)
        create_request("Order.list", [selection, query], object: Order)
      end
    end
  end
end
