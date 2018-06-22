# frozen_string_literal: true

module Textalk
  # ArticleChoiceOption Class
  # http://api.textalk.se/webshop/classes/ArticleChoiceOption/
  class ArticleChoiceOption < Model
    class << self
      def get(params, selection: true)
        handle_response Request.new(method: "ArticleChoiceOption.get", params: [selection, params]).run
      end

      def get_schema
        handle_response Request.new(method: "ArticleChoiceOption.getSchema", params: []).run
      end
    end
  end
end
