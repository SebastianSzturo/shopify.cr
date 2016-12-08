module Shopify
  class Product < Base
    @@resource = "product"

    JSON.mapping({
      id: Int64,
      title: String,
      body_html: String,
      vendor: String,
      product_type: String,
      created_at: Time,
      handle: String,
      updated_at: Time,
      published_at: Time,
      template_suffix: String | Nil,
      published_scope: String,
      tags: String,
      variants: Array(Variant) | Nil,
      options: Array(Product::Option),
      images: Array(Image),
      image: Image,
    })

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
end
