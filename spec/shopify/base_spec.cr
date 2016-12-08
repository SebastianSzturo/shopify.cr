require "../spec_helper"

private class Subclass < Shopify::Base; end

describe Shopify::Base do
  it "creates a client when setting a host" do
    Shopify::Base.host = "shop1.myshopify.com"

    Shopify::Base.client.should be_a(Shopify::Client)
    Shopify::Base.client.host.should be_a(String)
  end

  context "Subclass" do
    it "should have access to the Shopify::Base host" do
      Shopify::Base.host = "shop1.myshopify.com"
      Subclass.host.should eq("shop1.myshopify.com")
    end

    it "should have access to the Shopify::Base client" do
      Shopify::Base.host = "shop1.myshopify.com"
      Subclass.client.should be_a(Shopify::Client)
      Subclass.client.host.should eq("shop1.myshopify.com")
    end
  end
end
