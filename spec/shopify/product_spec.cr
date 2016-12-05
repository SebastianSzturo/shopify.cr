require "../spec_helper"

describe Shopify::Product do
  context "#find" do
    it "should cast response to Shopify::Product" do
      Shopify::Base.host = "shop1.myshopify.com"
      ShopifyMock.new(Shopify::Base.host)
        .stub(:get, "/products/1")
        .to_return_fixture

      product = Shopify::Product.find(1).as Shopify::Product
      product.should be_a(Shopify::Product)
      product.title.should eq("Apple iPhone 7")
    end
  end
end
