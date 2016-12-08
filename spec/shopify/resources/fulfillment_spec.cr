require "../../spec_helper"

describe Shopify::Fulfillment do
  context "#find" do
    it "should cast response" do
      Shopify::Base.host = "shop1.myshopify.com"
      ShopifyMock.new(Shopify::Base.host)
        .stub(:get, "/fulfillments/1")
        .to_return_fixture

      product = Shopify::Fulfillment.find(1)
      product.should be_a(Shopify::Fulfillment)
    end
  end
end
