require "http/client"

module Shopify
  class Client
    getter host : String
    getter token : String | Nil

    def initialize(@host, @token = nil)
      @host = parse_host(@host)

      @http_client = HTTP::Client.new(@host, tls: true)
    end

    def get(path : String)

      response = @http_client.get("/admin#{path}")
      handle_response(response)
    end

    private def handle_response(response : HTTP::Client::Response)
      case response.status_code
      when 200..299
        response.body
      when 400..499
        raise ClientError.new
      when 500
        raise ServerError.new("Internal Server Error")
      when 502
        raise ServerError.new("Bad Gateway")
      when 503
        raise ServerError.new("Service Unavailable")
      when 504
        raise ServerError.new("Gateway Timeout")
      else
        ClientError.new
      end
    end

    private def parse_host(host)
      host = host.strip
      host = host.gsub(/\Ahttps?:\/\//, "")
    end
  end
end
