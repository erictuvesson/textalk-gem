# frozen_string_literal: true

module Textalk
  # Url class
  # http://api.textalk.se/webshop/api-classes/Url/
  class Url < Model
    class << self
      def get(url, query: true)
        create_request("Url.get", [url, query])
      end
      
      def lookup(type, object, language, variant)
        create_request("Url.lookup", [type, object, language, variant])
      end
    end
  end
end
