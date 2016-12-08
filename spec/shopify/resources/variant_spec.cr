require "../../spec_helper"

describe Shopify::Variant do
  context "#find" do
    it "should cast response" do
      Shopify::Base.host = "shop1.myshopify.com"
      ShopifyMock.new(Shopify::Base.host)
        .stub(:get, "/variants/1")
        .to_return_fixture

      product = Shopify::Variant.find(1)
      product.should be_a(Shopify::Variant)
    end
  end
end
