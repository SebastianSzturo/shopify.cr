require "http/client"

module Shopify
  class Client
    getter url : String
    getter token : String | Nil

    def initialize(@url, @token = nil)
      @url = prepare_url(@url)
      @http_client = HTTP::Client.new(url)
    end

    def get(path : String)
      response = @http_client.get(path)
      handle_response(response)
    end

    private def prepare_url(url)
      url = url.strip
      url = url.gsub(/\Ahttps?:\/\//, "")
      "https://#{url}/admin"
    end
  end
end
