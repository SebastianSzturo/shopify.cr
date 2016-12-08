require "../../spec_helper"

describe Shopify::Refund do
  context "#find" do
    it "should cast response" do
      Shopify::Base.host = "shop1.myshopify.com"
      ShopifyMock.new(Shopify::Base.host)
        .stub(:get, "/refunds/1")
        .to_return_fixture

      product = Shopify::Refund.find(1)
      product.should be_a(Shopify::Refund)
    end
  end
end
