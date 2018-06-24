# frozen_string_literal: true

module Textalk
  # ArticleVariant Class
  class ArticleVariant < Model
    class << self
      def get(params, select_properties: properties_map)
        create_request("ArticleVariant.get", [true, params])
      end

      def get_schema
        create_request("ArticleVariant.getSchema", [])
      end
      
      def list(query = {}, selection = true)
        create_request("ArticleVariant.list", [selection, query], object: ArticleVariant)
      end
    end
  end
end
