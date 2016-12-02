require "./spec_helper"

describe Shopify do
  it "has a version number" do
    Shopify::VERSION.should_not be_nil
  end
end
