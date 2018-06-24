# frozen_string_literal: true

module Textalk
  # Theme Class
  # http://api.textalk.se/webshop/classes/Theme/
  class Theme < Model
    class << self
      def count(query = {})
        create_request("Theme.count", [query])
      end

      def create(patch, query = {})
        create_request("Theme.create", [patch, query])
      end

      def delete(uid)
        create_request("Theme.delete", [uid])
      end

      def get(uid, selection: true)
        create_request("Theme.get", [uid, selection], object: Article)
      end

      def get_schema
        create_request("Theme.getSchema", [])
      end

      def list(query = {}, selection: true)
        create_request("Theme.list", [selection, query], object: Article)
      end

      def select(query)
        create_request("Theme.select", [query])
      end

      def set(uid, patch, query)
        create_request("Theme.set", [uid, patch, query])
      end
    end
  end
end
