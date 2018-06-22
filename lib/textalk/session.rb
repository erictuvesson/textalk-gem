# frozen_string_literal: true

module Textalk
  # Session Class
  # http://api.textalk.se/webshop/classes/Session/
  class Session < Model
    class << self
      def delete
        create_request("Session.delete", [])
      end

      def get(query)
        create_request("Session.get", [query])
      end

      def get_order(query)
        create_request("Session.getOrder", [query])
      end

      def get_schema
        create_request("Session.getSchema", [])
      end

      def get_token
        create_request("Session.getToken", [])
      end

      def set(patch, query)
        create_request("Session.set", [patch, query])
      end

      def set_customer(uid)
        create_request("Session.setCustomer", [uid])
      end
    end
  end
end
