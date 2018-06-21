# frozen_string_literal: true

module Textalk
  class Model
    class << self
      def handle_response(resp)
        JSON.parse(resp.body)["result"]
      end
    end
  end
end
