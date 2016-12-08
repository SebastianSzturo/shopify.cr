module Shopify
  class TaxLine
    JSON.mapping({
      title: String,
      price: String,
      rate: Float32
    })
  end
end
