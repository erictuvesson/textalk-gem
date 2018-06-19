# frozen_string_literal: true

module Textalk
  # Url class
  # http://api.textalk.se/webshop/api-classes/Url/
  module Url
    def get(url)
      handle_resp Request.new(method: "Url.get", params: [url, true]).run
    end

    private

    def handle_resp(resp)
      JSON.parse(resp.body)["result"]
    end

    extend self
  end
end
