module Shopify
  class Variant < Base
    @@resource = "variant"

    JSON.mapping({
      id: Int64,
      product_id: Int64,
      title: String,
      price: String,
      sku: String,
      position: Int32,
      grams: Int32,
      inventory_policy: String,
      compare_at_price: String | Nil,
      fulfillment_service: String,
      inventory_management: String,
      option1: String | Nil,
      option2: String | Nil,
      option3: String | Nil,
      created_at: Time,
      updated_at: Time,
      taxable: Bool,
      barcode: String | Nil,
      image_id: Int64 | Nil,
      inventory_quantity: Int32,
      weight: Float32,
      weight_unit: String,
      old_inventory_quantity: Int32,
      requires_shipping: Bool,
    })
  end
end
