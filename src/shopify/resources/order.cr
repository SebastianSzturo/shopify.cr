module Shopify
  class Order < Base
    @@resource = "order"

    JSON.mapping({
      id: Int64,
      email: String,
      closed_at: Time | Nil,
      created_at: Time,
      updated_at: Time,
      number: Int32,
      note: String | Nil,
      token: String,
      gateway: String,
      test: Bool,
      total_price: String,
      subtotal_price: String,
      total_weight: Int32,
      total_tax: String,
      taxes_included: Bool,
      currency: String,
      financial_status: String,
      confirmed: Bool,
      total_discounts: String,
      total_line_items_price: String,
      cart_token: String,
      buyer_accepts_marketing: Bool,
      name: String,
      referring_site: String,
      landing_site: String,
      cancelled_at: Time | Nil,
      cancel_reason: String | Nil,
      total_price_usd: String,
      checkout_token: String | Nil,
      reference: String,
      user_id: Int64 | Nil,
      location_id: Int64 | Nil,
      source_identifier: String | Nil,
      source_url: String | Nil,
      processed_at: Time,
      device_id: String | Nil,
      browser_ip: String | Nil,
      landing_site_ref: String | Nil,
      order_number: Int32,
      discount_codes: Array(Hash(String, String)),
      note_attributes: Array(Hash(String, String)),
      payment_gateway_names: Array(String),
      processing_method: String,
      checkout_id: Int64,
      source_name: String,
      fulfillment_status: String | Nil,
      tax_lines: Array(Order::TaxLine),
      tags: String,
      contact_email: String,
      order_status_url: String | Nil,
      line_items: Array(Order::LineItem),
      shipping_lines: Array(Order::ShippingLine),
      billing_address: Order::Address,
      shipping_address: Order::Address,
      # fulfillments: Array(Fulfillment),
      client_details: Order::ClientDetails,
      # refunds: Array(Refund),
      payment_details: Order::PaymentDetails,
      # customer: Customer
    })

    class TaxLine
      JSON.mapping({
        title: String,
        price: String,
        rate: Float32
      })
    end

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

    class ShippingLine
      JSON.mapping({
        id: Int64,
        title: String,
        price: String,
        code: String,
        source: String,
        phone: String | Nil,
        requested_fulfillment_service_id: Int64 | Nil,
        delivery_category: String | Nil,
        carrier_identifier: String | Nil,
        tax_lines: Array(TaxLine)
      })
    end

    class Address
      JSON.mapping({
        first_name: String,
        address1: String,
        phone: String,
        city: String,
        zip: String,
        province: String,
        country: String,
        last_name: String,
        address2: String,
        company: String | Nil,
        latitude: Float32,
        longitude: Float32,
        name: String,
        country_code: String,
        province_code: String
      })
    end

    class ClientDetails
      JSON.mapping({
        browser_ip: String,
        accept_language: String | Nil,
        user_agent: String | Nil,
        session_hash: String | Nil,
        browser_width: String | Nil,
        browser_height: String | Nil
      })
    end

    class PaymentDetails
      JSON.mapping({
        credit_card_bin: String | Nil,
        avs_result_code: String | Nil,
        cvv_result_code: String | Nil,
        credit_card_number: String | Nil,
        credit_card_company: String | Nil
      })
    end
  end
end
