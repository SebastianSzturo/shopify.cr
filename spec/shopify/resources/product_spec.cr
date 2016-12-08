require "../../spec_helper"

describe Shopify::Product do
  context "#find" do
    it "should cast response" do
      Shopify::Base.host = "shop1.myshopify.com"
      ShopifyMock.new(Shopify::Base.host)
        .stub(:get, "/products/1")
        .to_return_fixture

      product = Shopify::Product.find(1)
      product.should be_a(Shopify::Product)
    end
  end
end
