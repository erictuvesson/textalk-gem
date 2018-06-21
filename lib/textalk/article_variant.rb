# frozen_string_literal: true

module Textalk
  # ArticleVariant Class
  class ArticleVariant < Model
    class << self
      def get(params, select_properties: properties_map)
        handle_resp Request.new(method: "ArticleVariant.get", params: [true, params]).run
      end

      def get_schema
        handle_resp Request.new(method: "ArticleVariant.getSchema", params: []).run
      end
    end
  end
end
