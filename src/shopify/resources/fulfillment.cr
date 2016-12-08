module Shopify
  class Fulfillment < Base
    @@resource = "fulfillment"

    JSON.mapping({
      id: Int64,
      order_id: Int64,
      status: String,
      created_at: Time,
      service: String,
      updated_at: Time,
      tracking_company: String | Nil,
      shipment_status: String | Nil,
      tracking_numbers: Array(String),
      tracking_url: String,
      tracking_urls: Array(String),
      receipt: Fulfillment::Receipt,
      line_items: Array(LineItem),
    })

    class Receipt
      JSON.mapping({
        testcase: Bool,
        authorization: String
      })
    end
  end
end
