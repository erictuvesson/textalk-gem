# frozen_string_literal: true

module Textalk
  # Article Class
  # http://api.textalk.se/webshop/api-classes/Article/
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
        "introductionText",
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
        "showInArticlegroups",
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
      Hash[*properties.map{ |obj| [obj, true] }.flatten]
    end

    def count(query)
      handle_resp Request.new(method: "Article.count", params: [query]).run
    end

    def create(patch)
      handle_resp Request.new(method: "Article.create", params: [patch]).run
    end

    def get(params, select_properties: properties_map)
      handle_resp Request.new(method: "Article.get", params: [select_properties, params]).run
    end

    def get_schema
      handle_resp Request.new(method: "Article.getSchema", params: []).run
    end

    def list(query = {}, select_properties: properties_map)
      handle_resp Request.new(method: "Article.list", params: [select_properties, query]).run
    end

    def set(uid, patch, query)
      handle_resp Request.new(method: "Article.set", params: [uuid, patch, query]).run
    end

    def subscribe_to_stock(uid, email, language)
      handle_resp Request.new(method: "Article.subscribeToStock", params: [uuid, patch, query]).run
    end

    private

    def handle_resp(resp)
      JSON.parse(resp.body)["result"]
    end

    extend self
  end
end
