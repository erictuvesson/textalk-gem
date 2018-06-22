# frozen_string_literal: true

module Textalk
  # Suborder Class
  # http://api.textalk.se/webshop/classes/Suborder/
  class Suborder < Model
    class << self
      def get(uid, selection: true)
        create_request("Suborder.get", [uid, selection], object: Suborder)
      end

      def get_schema
        create_request("Suborder.getSchema", [])
      end

      def set(uid, patch, query)
        create_request("Suborder.set", [uid, patch, query])
      end
    end
  end
end
