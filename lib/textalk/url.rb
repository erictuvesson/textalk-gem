# frozen_string_literal: true

module Textalk
  # Url class
  # http://api.textalk.se/webshop/api-classes/Url/
  class Url < Model
    class << self
      def get(url)
        handle_response Request.new(method: "Url.get", params: [url, true]).run
      end
    end
  end
end
