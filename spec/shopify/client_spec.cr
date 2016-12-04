require "../spec_helper"

describe Shopify::Client do
  context ".new" do
    it "initializes with host and token" do
      client = Shopify::Client.new("shop1.myshopify.com", "token")
      client.host.should eq("shop1.myshopify.com")
      client.token.should eq("token")
    end

    it "initializes without token" do
      client = Shopify::Client.new("shop1.myshopify.com")
      client.host.should eq("shop1.myshopify.com")
      client.token.should be_nil
    end

    it "initializes with a user:password host" do
      client = Shopify::Client.new("user:password@shop1.myshopify.com")
      client.host.should eq("user:password@shop1.myshopify.com")
    end

    it "transforms htpps url into a host" do
      client = Shopify::Client.new("https://shop1.myshopify.com")
      client.host.should eq("shop1.myshopify.com")
    end

    it "transforms http url a host" do
      client = Shopify::Client.new("https://shop1.myshopify.com")
      client.host.should eq("shop1.myshopify.com")
    end
  end

  context ".get" do
    it "should handle valid response" do
      client = Shopify::Client.new("shop1.myshopify.com")
      ShopifyMock.new(client.host)
        .stub(:get, "/products/1")
        .with_fixtures

      client.get("/products/1").should eq("OK")
    end
  end
end
