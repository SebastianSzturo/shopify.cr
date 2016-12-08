module Shopify
  class Image < Base
    @@resource = "image"

    JSON.mapping({
      id: Int64,
      product_id: Int64,
      position: Int32,
      created_at: Time,
      updated_at: Time,
      src: String,
      variant_ids: Array(Int64),
    })
  end
end
