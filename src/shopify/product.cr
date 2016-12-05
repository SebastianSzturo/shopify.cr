module Shopify
  class Product < Base
    @@resource = "product"

    JSON.mapping({
      id: Int64,
      title: String,
      body_html: String,
    })
  end
end
