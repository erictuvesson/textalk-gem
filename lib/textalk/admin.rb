# frozen_string_literal: true

module Textalk
  # Admin Class
  # http://api.textalk.se/webshop/classes/Admin/
  class Admin < Model
    class << self
      def count(query)
        create_request("Admin.count", [query])
      end

      def get(params, selection: true)
        create_request("Admin.get", [selection, params])
      end

      def get_schema
        create_request("Admin.getSchema", [])
      end

      def list(query = {}, selection: true)
        create_request("Admin.list", [selection, query])
      end

      def login(username, password)
        create_request("Admin.login", [username, password])
      end
    end
  end
end
