# frozen_string_literal: true

module Textalk
  # ArticleChoiceOption Class
  # http://api.textalk.se/webshop/classes/ArticleChoiceOption/
  class ArticleChoiceOption < Model
    class << self
      def get(params, selection = true)
        create_request("ArticleChoiceOption.get", [selection, params])
      end

      def get_schema
        create_request("ArticleChoiceOption.getSchema", [])
      end
    end
  end
end
