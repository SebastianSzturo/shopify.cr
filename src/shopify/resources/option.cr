module Shopify
  class Option < Base
    JSON.mapping({
      id: Int64,
      product_id: Int64,
      name: String,
      position: Int32,
      values: Array(String),
    })
  end
end
