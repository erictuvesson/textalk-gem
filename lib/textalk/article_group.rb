# frozen_string_literal: true

module Textalk
  # Articlegroup Class
  # http://api.textalk.se/webshop/api-classes/Articlegroup/
  class ArticleGroup < Model
    class << self
      def count(query)
        create_request("Articlegroup.count", [query])
      end

      def get(params, select_properties: true)
        create_request("Articlegroup.get", [select_properties, params])
      end

      def get_schema
        create_request("Articlegroup.getSchema", [])
      end

      def list(query = {}, select_properties: true)
        create_request("Articlegroup.list", [select_properties, query])
      end

      def set(params)
        create_request("Articlegroup.set", [params])
      end
    end
  end
end
