module Shopify
  class Transaction < Base
    @@resource = "transaction"

    JSON.mapping({
      id: Int64,
      order_id: Int64,
      amount: String,
      kind: String,
      gateway: String,
      status: String,
      message: String | Nil,
      created_at: Time,
      test: Bool,
      authorization: String,
      currency: String,
      location_id: Int64 | Nil,
      user_id: Int64 | Nil,
      parent_id: Int64 | Nil,
      device_id: Int64 | Nil,
      error_code: String | Nil,
      source_name: String,
    })
  end
end
