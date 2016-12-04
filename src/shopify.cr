require "./shopify/*"

module Shopify
  class ClientError < Exception; end
  class ServerError < Exception; end
end
