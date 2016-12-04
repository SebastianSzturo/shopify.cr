module Shopify
  class Base
    @@client : Shopify::Client = Shopify::Client.new("myshopify.com")

    def self.host=(host)
      @@client = Shopify::Client.new(host)
    end

    def self._client
      @@client
    end

    def self.client
      Shopify::Base._client
    end

    def self.host
      Shopify::Base.client.try &.host
    end
  end
end
