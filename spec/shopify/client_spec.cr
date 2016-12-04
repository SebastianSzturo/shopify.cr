require "../spec_helper"

describe Shopify::Client do
  context "#initialize" do
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

  context "#get" do
    it "should return body for a valid response" do
      client = Shopify::Client.new("shop1.myshopify.com")
      ShopifyMock.new(client.host)
        .stub(:get, "/products/1")
        .to_return_fixture

      client.get("/products/1").should be_a(String)
    end

    it "should raise a ClientError for 4xx" do
      client = Shopify::Client.new("shop1.myshopify.com")
      ShopifyMock.new(client.host)
        .stub(:get, "/products/1")
        .to_return(status: 404)

      expect_raises(Shopify::ClientError) do
        client.get("/products/1")
      end
    end

    it "should raise a ServerError for 500" do
      client = Shopify::Client.new("shop1.myshopify.com")
      ShopifyMock.new(client.host)
        .stub(:get, "/products/1")
        .to_return(status: 500)

      expect_raises(Shopify::ServerError, "Internal Server Error") do
        client.get("/products/1")
      end
    end

    it "should raise a ServerError for 502" do
      client = Shopify::Client.new("shop1.myshopify.com")
      ShopifyMock.new(client.host)
        .stub(:get, "/products/1")
        .to_return(status: 502)

      expect_raises(Shopify::ServerError, "Bad Gateway") do
        client.get("/products/1")
      end
    end

    it "should raise a ServerError for 503" do
      client = Shopify::Client.new("shop1.myshopify.com")
      ShopifyMock.new(client.host)
        .stub(:get, "/products/1")
        .to_return(status: 503)

      expect_raises(Shopify::ServerError, "Service Unavailable") do
        client.get("/products/1")
      end
    end

    it "should raise a ServerError for 504" do
      client = Shopify::Client.new("shop1.myshopify.com")
      ShopifyMock.new(client.host)
        .stub(:get, "/products/1")
        .to_return(status: 504)

      expect_raises(Shopify::ServerError, "Gateway Timeout") do
        client.get("/products/1")
      end
    end
  end
end
