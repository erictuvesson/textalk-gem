# frozen_string_literal: true

module Textalk
  # Articlegroup Class
  # http://api.textalk.se/webshop/api-classes/Articlegroup/
  class ArticleGroup < Model
    class << self
      def count(query)
        handle_response Request.new(method: "Articlegroup.count", params: [query]).run
      end

      def get(params, select_properties: true)
        handle_response Request.new(method: "Articlegroup.get", params: [select_properties, params]).run
      end

      def get_schema
        handle_response Request.new(method: "Articlegroup.getSchema", params: []).run
      end

      def list(query = {}, select_properties: true)
        handle_response Request.new(method: "Articlegroup.list", params: [select_properties, query]).run
      end

      def set(params)
        handle_response Request.new(method: "Articlegroup.set", params: [params]).run
      end
    end
  end
end
