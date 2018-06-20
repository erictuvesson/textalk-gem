# frozen_string_literal: true

require "faraday"
require "write_xlsx"

require "textalk/configuration"
require "textalk/request"

module Textalk
  autoload :Article, "textalk/article"
  autoload :ArticleGroup, "textalk/article_group"
  autoload :Url, "textalk/url"

  module Utils
    autoload :Backup, "textalk/utils/backup"
    autoload :Stock, "textalk/utils/stock"
  end

  define_setting :endpoint,   ENV["TEXTALK_ENDPOINT"]
  define_setting :api_key,    ENV["TEXTALK_API_KEY"]
  define_setting :webshop_id, ENV["TEXTALK_WEBSHOP_ID"]

  def self.build_url
    "#{Textalk.endpoint}?webshop=#{Textalk.webshop_id}&auth=#{Textalk.api_key}"
  end
end

require "textalk/railtie" if defined?(Rails)
