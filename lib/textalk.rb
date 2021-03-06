# frozen_string_literal: true

require "faraday"
require "write_xlsx"

require "textalk/configuration"
require "textalk/request"
require "textalk/model"

module Textalk
  autoload :Admin, "textalk/admin"
  autoload :ArticleChoiceOption, "textalk/article_choice_option"
  autoload :ArticleChoice, "textalk/article_choice"
  autoload :ArticleGroup, "textalk/article_group"
  autoload :ArticleVariant, "textalk/article_variant"
  autoload :Article, "textalk/article"
  autoload :AuthToken, "textalk/auth_token"
  autoload :CustomPageItem, "textalk/custom_page_item"
  autoload :CustomPage, "textalk/custom_page"
  autoload :Customer, "textalk/customer"
  autoload :EventListener, "textalk/event_listener"
  autoload :IntegrationType, "textalk/integration_type"
  autoload :Integration, "textalk/integration"
  autoload :Language, "textalk/language"
  autoload :OrderItem, "textalk/order_item"
  autoload :Order, "textalk/order"
  autoload :Payment, "textalk/payment"
  autoload :Session, "textalk/session"
  autoload :Suborder, "textalk/suborder"
  autoload :Supplier, "textalk/supplier"
  autoload :Theme, "textalk/theme"
  autoload :Url, "textalk/url"
  autoload :Webshop, "textalk/webshop"

  module Helpers
    autoload :Excel, "textalk/helpers/excel"
  end

  module Utils
    autoload :Backup, "textalk/utils/backup"
    autoload :Stock, "textalk/utils/stock"
  end

  define_setting :endpoint,   ENV["TEXTALK_ENDPOINT"]
  define_setting :api_key,    ENV["TEXTALK_API_KEY"]
  define_setting :webshop_id, ENV["TEXTALK_WEBSHOP_ID"]
  define_setting :debug,      ENV["TEXTALK_DEBUG"]
end

require "textalk/railtie" if defined?(Rails)
