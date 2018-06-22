# frozen_string_literal: true

module Textalk
  # Payment Class
  # http://api.textalk.se/webshop/classes/Payment/
  class Payment < Model
    class << self
      def capture
        create_request("Payment.capture", [])
      end

      def get(uid)
        create_request("Payment.get", [uid], object: Payment)
      end

      def get_schema
        create_request("Payment.getSchema", [])
      end

      def set(uid, patch, query)
        create_request("Payment.set", [uid, patch, query])
      end
    end
  end
end
