# frozen_string_literal: true

module Textalk
  # ArticleChoice Class
  # http://api.textalk.se/webshop/classes/ArticleChoice/
  class ArticleChoice < Model
    class << self
      def get(params, selection: true)
        handle_response Request.new(method: "ArticleChoice.get", params: [selection, params]).run
      end

      def get_schema
        handle_response Request.new(method: "ArticleChoice.getSchema", params: []).run
      end
    end
  end
end
