# frozen_string_literal: true

module Textalk
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

    def count(params)
      Request.new(method: "Articlegroup.count", params: { }).run
    end

    def list(params = {}, select_properties: properties_map)
      handle_resp Request.new(method: "Articlegroup.list", params: [select_properties, params]).run
    end

    def get(params)
      Request.new(method: "Articlegroup.get", params: params).run
    end

    def set(params)
      Request.new(method: "Articlegroup.set", params: params).run
    end

    private

    def handle_resp(resp)
      JSON.parse(resp.body)["result"]
    end

    extend self
  end
end
