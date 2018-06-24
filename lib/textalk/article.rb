# frozen_string_literal: true

module Textalk
  # Article Class
  # http://api.textalk.se/webshop/api-classes/Article/
  class Article < Model
    def stock
      {
        total: @variables.dig(:stock, :stock),
        variants: variants
      }
    end

    def variants
      return nil unless @variables[:variants]
      @variables[:variants].map do |variant| 
        id = variant[:definedBy].keys.first
        enum_id = variant[:definedBy].values.first.to_sym
        { 
          id: id,
          enum_id: enum_id,
          name: choices[id][:enumNames][enum_id],
          stock: variant.dig(:overrides, :stock) 
        } 
      end
    end

    def choices(locale = :en)
      @variables[:choiceSchema][locale][:properties]
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
