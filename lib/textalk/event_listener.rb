# frozen_string_literal: true

module Textalk
  # EventListener class
  # http://api.textalk.se/webshop/api-classes/EventListener/#
  class EventListener < Model
    class << self
      def list(query = {}, select_properties: properties_map)
        handle_response Request.new(method: "EventListener.list", params: [select_properties, query]).run
      end
      
      def get(uid, select_properties: properties_map)
        handle_response Request.new(method: "EventListener.get", params: [uid, select_properties]).run
      end

      def create(event_name, url)
        data = {
          authToken: Textalk.api_key,
          eventName: event_name,
          url: url
        }
        handle_response Request.new(method: "EventListener.create", params: [data, ["uid", "status"]]).run
      end

      def set(uid, patch, query)
        handle_response Request.new(method: "EventListener.set", params: [uid, patch, query]).run
      end

      def delete(uid)
        handle_response Request.new(method: "EventListener.delete", params: [uid]).run
      end

      def get_log(uid)
        handle_response Request.new(method: "EventListener.getLog", params: [uid]).run
      end
    end
  end
end
