# frozen_string_literal: true

module Textalk
  # Article Class
  # http://api.textalk.se/webshop/api-classes/Article/
  class Article < Model
    class << self
      def count(query)
        handle_response Request.new(method: "Article.count", params: [query]).run
      end

      def create(patch, query = {})
        handle_response Request.new(method: "Article.create", params: [patch, query]).run
      end

      def get(params, selection: true)
        handle_response Request.new(method: "Article.get", params: [selection, params]).run
      end

      def get_schema
        handle_response Request.new(method: "Article.getSchema", params: []).run
      end

      def list(query = {}, selection: true)
        handle_response Request.new(method: "Article.list", params: [selection, query]).run
      end

      def set(uid, patch, query)
        handle_response Request.new(method: "Article.set", params: [uid, patch, query]).run
      end

      def normalize(uid, patch)
        handle_response Request.new(method: "Article.normalize", params: [uid, patch]).run
      end

      def validate(uid, patch)
        handle_response Request.new(method: "Article.validate", params: [uid, patch]).run
      end
    end
  end
end
