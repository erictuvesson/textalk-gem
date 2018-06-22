# frozen_string_literal: true

module Textalk
  # Article Class
  # http://api.textalk.se/webshop/api-classes/Article/
  class Article < Model
    def stock
      {
        total: @variables.dig(:stock, :stock),
        variants: @variables[:variants]
      }
    end

    def to_liquid
      {
        uid: @variables[:uid],
        articleNumber: @variables[:articleNumber]
      }
    end

    class << self
      def count(query = {})
        create_request("Article.count", [query])
      end

      def create(patch, query = {})
        create_request("Article.create", [patch, query])
      end

      def get(uid, selection: true)
        create_request("Article.get", [uid, selection], object: Article)
      end

      def get_schema
        create_request("Article.getSchema", [])
      end

      def list(query = {}, selection: true)
        create_request("Article.list", [selection, query], object: Article)
      end

      def set(uid, patch, query)
        create_request("Article.set", [uid, patch, query])
      end

      def normalize(uid, patch)
        create_request("Article.normalize", [uid, patch])
      end

      def validate(uid, patch)
        create_request("Article.validate", [uid, patch])
      end
    end
  end
end
