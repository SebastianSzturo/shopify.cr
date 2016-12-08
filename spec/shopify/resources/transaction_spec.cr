require "../../spec_helper"

describe Shopify::Transaction do
  context "#find" do
    it "should cast response" do
      Shopify::Base.host = "shop1.myshopify.com"
      ShopifyMock.new(Shopify::Base.host)
        .stub(:get, "/transactions/1")
        .to_return_fixture

      product = Shopify::Transaction.find(1)
      product.should be_a(Shopify::Transaction)
    end
  end
end
