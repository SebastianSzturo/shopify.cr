require "../spec_helper"

describe Shopify::Client do
  context ".new" do
    it "can be initialized with url and token" do
      client = Shopify::Client.new("https://shop1.myshopify.com", "token")
      client.url.should eq("https://shop1.myshopify.com/admin")
      client.token.should eq("token")
    end

    it "can be initialized without token" do
      client = Shopify::Client.new("https://shop1.myshopify.com")
      client.url.should eq("https://shop1.myshopify.com/admin")
      client.token.should be_nil
    end

    it "can be initialized with a user:password url" do
      client = Shopify::Client.new("https://user:password@shop1.myshopify.com")
      client.url.should eq("https://user:password@shop1.myshopify.com/admin")
    end

    it "transforms url into a https admin url" do
      client = Shopify::Client.new("shop1.myshopify.com")
      client.url.should eq("https://shop1.myshopify.com/admin")
    end

    it "transforms http url a https admin url" do
      client = Shopify::Client.new("http://shop1.myshopify.com")
      client.url.should eq("https://shop1.myshopify.com/admin")
    end
  end
end
