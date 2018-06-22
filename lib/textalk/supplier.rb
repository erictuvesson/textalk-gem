# frozen_string_literal: true

module Textalk
  # Supplier Class
  # http://api.textalk.se/webshop/classes/Supplier/
  class Supplier < Model
    class << self
      def count(query = {})
        create_request("Supplier.count", [query])
      end

      def get(uid)
        create_request("Supplier.get", [uid], object: Payment)
      end

      def get_schema
        create_request("Supplier.getSchema", [])
      end

      def list(query = {}, selection: true)
        create_request("Supplier.list", [selection, query], object: Article)
      end

      def get_suborders(filter, query: {}, offset = 0, limit = 100)
        create_request("Supplier.getSuborders", [filter, query, offset, limit])
      end
    end
  end
end
