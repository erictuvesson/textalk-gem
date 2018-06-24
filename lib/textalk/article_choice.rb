# frozen_string_literal: true

module Textalk
  # ArticleChoice Class
  # http://api.textalk.se/webshop/classes/ArticleChoice/
  class ArticleChoice < Model
    class << self
      def get(params, selection = true)
        create_request("ArticleChoice.get", [selection, params])
      end

      def get_schema
        create_request("ArticleChoice.getSchema", [])
      end
    end
  end
end
