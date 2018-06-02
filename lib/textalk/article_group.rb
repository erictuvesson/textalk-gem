# frozen_string_literal: true

module Textalk
  module ArticleGroup
    def count(params)
      Request.new(method: "Articlegroup.count", params: { }).run
    end

    def list(params)
      Request.new(method: "Articlegroup.list", params: params).run
    end

    def get(params)
      Request.new(method: "Articlegroup.get", params: params).run
    end

    def set(params)
      Request.new(method: "Articlegroup.set", params: params).run
    end

    extend self
  end
end
