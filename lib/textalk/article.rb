# frozen_string_literal: true

module Textalk
  # Article Class
  # http://api.textalk.se/webshop/api-classes/Article/
  class Article < Model
    class << self
      def count(query)
        handle_response Request.new(method: "Article.count", params: [query]).run
      end

      def create(patch)
        handle_response Request.new(method: "Article.create", params: [patch]).run
      end

      def get(params, properties: true)
        handle_response Request.new(method: "Article.get", params: [properties, params]).run
      end

      def get_schema
        handle_response Request.new(method: "Article.getSchema", params: []).run
      end

      def list(query = {}, properties: true)
        handle_response Request.new(method: "Article.list", params: [properties, query]).run
      end

      def set(uid, patch, query)
        handle_response Request.new(method: "Article.set", params: [uuid, patch, query]).run
      end

      def subscribe_to_stock(uid, email, language)
        handle_response Request.new(method: "Article.subscribeToStock", params: [uuid, patch, query]).run
      end
    end
  end
end
