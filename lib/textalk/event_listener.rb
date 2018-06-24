# frozen_string_literal: true

module Textalk
  # EventListener class
  # http://api.textalk.se/webshop/api-classes/EventListener/#
  class EventListener < Model
    class << self
      def list(query = {}, selection = true)
        create_request("EventListener.list", [uid, selection])
      end
      
      def get(uid, selection = true)
        create_request("EventListener.get", [uid, selection])
      end

      def create(event_name, url)
        data = {
          authToken: Textalk.api_key,
          eventName: event_name,
          url: url
        }
        create_request("EventListener.create", [data, ["uid", "status"]])
      end

      def set(uid, patch, query)
        create_request("EventListener.set", [uid, patch, query])
      end

      def delete(uid)
        create_request("EventListener.delete", [uid])
      end

      def get_log(uid)
        create_request("EventListener.getLog", [uid])
      end
    end
  end
end
