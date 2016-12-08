module Shopify
  class LineItem
    JSON.mapping({
      id: Int64,
      variant_id: Int64,
      title: String,
      quantity: Int32,
      price: String,
      grams: Int32,
      sku: String,
      variant_title: String,
      vendor: String | Nil,
      fulfillment_service: String,
      product_id: Int64,
      requires_shipping: Bool,
      taxable: Bool,
      gift_card: Bool,
      name: String,
      variant_inventory_management: String,
      properties: Array(Hash(String, String)),
      product_exists: Bool,
      fulfillable_quantity: Int32,
      total_discount: String,
      fulfillment_status: String | Nil,
      tax_lines: Array(TaxLine)
    })
  end
end
