# frozen_string_literal: true

module Textalk
  # Admin Class
  # http://api.textalk.se/webshop/classes/Admin/
  class Admin < Model
    class << self
      def count(query)
        handle_response Request.new(method: "Admin.count", params: [query]).run
      end

      def get(params, selection: true)
        handle_response Request.new(method: "Admin.get", params: [selection, params]).run
      end

      def get_schema
        handle_response Request.new(method: "Admin.getSchema", params: []).run
      end

      def list(query = {}, selection: true)
        handle_response Request.new(method: "Admin.list", params: [selection, query]).run
      end

      def login(username, password)
        handle_response Request.new(method: "Admin.login", params: [username, password]).run
      end
    end
  end
end
