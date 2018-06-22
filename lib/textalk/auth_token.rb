# frozen_string_literal: true

module Textalk
  # AuthToken Class
  # http://api.textalk.se/webshop/classes/AuthToken/
  class AuthToken < Model
    class << self
      def count(query)
        create_request("AuthToken.count", [query])
      end

      def create(patch, query = {})
        create_request("AuthToken.create", [patch, query])
      end

      def get(params, selection: true)
        create_request("AuthToken.get", [selection, params])
      end

      def get_schema
        create_request("AuthToken.getSchema", [])
      end

      def list(query = {}, selection: true)
        create_request("AuthToken.list", [selection, query])
      end

      def set(uid, patch, query)
        create_request("AuthToken.set", [uid, patch, query])
      end

      def validate(uid, patch)
        create_request("AuthToken.validate", [uid, patch])
      end
    end
  end
end
