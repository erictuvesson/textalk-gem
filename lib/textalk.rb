# frozen_string_literal: true

require "faraday"

require "textalk/configuration"
require "textalk/request"

module Textalk
  autoload :Article, "textalk/article"
  autoload :ArticleGroup, "textalk/article_group"
  autoload :Url, "textalk/url"

  define_setting :endpoint,   ENV["TEXTALK_ENDPOINT"]
  define_setting :api_key,    ENV["TEXTALK_API_KEY"]
  define_setting :webshop_id, ENV["TEXTALK_WEBSHOP_ID"]

  def self.build_url
    "#{Textalk.endpoint}?webshop=#{Textalk.webshop_id}&auth=#{Textalk.api_key}"
  end
end
