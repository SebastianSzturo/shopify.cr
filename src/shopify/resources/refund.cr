module Shopify
  class Refund < Base
    @@resource = "refund"

    JSON.mapping({
      id: Int64,
      order_id: Int64,
      created_at: Time,
      note: String | Nil,
      restock: Bool,
      user_id: Int64,
      refund_line_items: Array(RefundLineItem),
      transactions: Array(Transaction)
    })

    class RefundLineItem
      JSON.mapping({
        id: Int64,
        quantity: Int32,
        subtotal: Float32,
        total_tax: Float32,
        line_item: LineItem
      })
    end
  end
end
