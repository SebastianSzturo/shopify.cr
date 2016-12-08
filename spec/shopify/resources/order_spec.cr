require "../../spec_helper"

describe Shopify::Order do
  context "#find" do
    it "should cast response" do
      Shopify::Base.host = "shop1.myshopify.com"
      ShopifyMock.new(Shopify::Base.host)
        .stub(:get, "/orders/1")
        .to_return_fixture

      product = Shopify::Order.find(1)
      product.should be_a(Shopify::Order)
    end
  end
end
