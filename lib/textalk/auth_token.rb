# frozen_string_literal: true

module Textalk
  # AuthToken Class
  # http://api.textalk.se/webshop/classes/AuthToken/
  class AuthToken < Model
    class << self
      def count(query)
        handle_response Request.new(method: "AuthToken.count", params: [query]).run
      end

      def create(patch, query = {})
        handle_response Request.new(method: "AuthToken.create", params: [patch, query]).run
      end

      def get(params, selection: true)
        handle_response Request.new(method: "AuthToken.get", params: [selection, params]).run
      end

      def get_schema
        handle_response Request.new(method: "AuthToken.getSchema", params: []).run
      end

      def list(query = {}, selection: true)
        handle_response Request.new(method: "AuthToken.list", params: [selection, query]).run
      end

      def set(uid, patch, query)
        handle_response Request.new(method: "AuthToken.set", params: [uid, patch, query]).run
      end

      def validate(uid, patch)
        handle_response Request.new(method: "AuthToken.validate", params: [uid, patch]).run
      end
    end
  end
end
