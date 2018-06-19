# frozen_string_literal: true

module Textalk
  # Articlegroup Class
  # http://api.textalk.se/webshop/api-classes/Articlegroup/
  module ArticleGroup
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

    def count(query)
      handle_resp Request.new(method: "Articlegroup.count", params: [query]).run
    end

    def get(params, select_properties: properties_map)
      handle_resp Request.new(method: "Articlegroup.get", params: [select_properties, params]).run
    end

    def get_schema
      handle_resp Request.new(method: "Articlegroup.getSchema", params: []).run
    end

    def list(query = {}, select_properties: properties_map)
      handle_resp Request.new(method: "Articlegroup.list", params: [select_properties, query]).run
    end

    def set(params)
      handle_resp Request.new(method: "Articlegroup.set", params: [params]).run
    end

    private

    def handle_resp(resp)
      JSON.parse(resp.body)["result"]
    end

    extend self
  end
end
