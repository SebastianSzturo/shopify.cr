require "json"
require "inflector"

module Shopify
  class Base
    @@client : Shopify::Client = Shopify::Client.new("myshopify.com")

    def self.find(id)
      resources = Inflector.pluralize(@@resource)
      response = self.client.get("/#{resources}/#{id}")

      return unless response.is_a?(String)
      from_json(response, root: @@resource)
    end

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
