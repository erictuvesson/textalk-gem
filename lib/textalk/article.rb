module Textalk
  module Article
    def properties
      [
        "articlegroup",
        "articleNumber",
        "articleTemplate",
        "attributes",
        "attachments",
        "baseName",
        "choiceOptions",
        "choiceOptionPrices",
        "choices",
        "description",
        "draft",
        "ean",
        "hidden",
        "images",
        "isBuyable",
        "metaDescription",
        "metaKeywords",
        "name",
        "news",
        "orderedWithArticles",
        "pageTitle",
        "presentationOnly",
        "price",
        "relationLists",
        "showInarticlegroups",
        "sku",
        "stock",
        "type",
        "uid",
        "unit",
        "url",
        "vatIsIncluded",
        "vatRate",
        "weight"
      ]
    end

    def properties_map
      Hash[*properties.map{ |obj| [obj.id, obj] }.flatten]
    end

    def count(params, select_properties: properties_map)
      handle_resp Request.new(method: "Article.count", params: [select_properties, params]).run
    end

    def list(params = {}, select_properties: properties_map)
      handle_resp Request.new(method: "Article.list", params: [select_properties, params]).run
    end

    def get(params, select_properties: properties_map)
      handle_resp Request.new(method: "Article.get", params: [select_properties, params]).run
    end

    def set(uid, params)
      handle_resp Request.new(method: "Article.set", params: [uuid, params]).run
    end

    private

    def handle_resp(resp)
      JSON.parse resp.body["result"]
    end

    extend self
  end
end
