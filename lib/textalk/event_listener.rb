# frozen_string_literal: true

module Textalk
  # EventListener class
  # http://api.textalk.se/webshop/api-classes/EventListener/#
  module EventListener
    def properties
      [
        "baseName",
        "children",
        "description",
        "hidden",
        "image",
        "metaDescription",
        "metaKeywords",
        "name",
        "pageItems",
        "pageTitle",
        "parent",
        "uid",
        "url"
      ]
    end

    def properties_map
      Hash[*properties.map{ |obj| [obj, true] }.flatten]
    end

    def list(query = {}, select_properties: properties_map)
      handle_resp Request.new(method: "EventListener.list", params: [select_properties, query]).run
    end
    
    def get(uid, select_properties: properties_map)
      handle_resp Request.new(method: "EventListener.get", params: [uid, select_properties]).run
    end

    def create(event_name, url)
      data = {
        authToken: Textalk.api_key,
        eventName: event_name,
        url: url
      }
      handle_resp Request.new(method: "EventListener.create", params: [data, ["uid", "status"]]).run
    end

    def set(uid, patch, query)
      handle_resp Request.new(method: "EventListener.set", params: [uid, patch, query]).run
    end

    def delete(uid)
      handle_resp Request.new(method: "EventListener.delete", params: [uid]).run
    end

    def get_log(uid)
      handle_resp Request.new(method: "EventListener.getLog", params: [uid]).run
    end

    private

    def handle_resp(resp)
      JSON.parse(resp.body)["result"]
    end

    extend self
  end
end
