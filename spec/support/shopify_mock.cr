class ShopifyMock
  PROTOCOL = "https://"
  @host : String
  @method : Symbol
  @url : String

  def initialize(host)
    @host = host

    @method = :any
    @url = "#{PROTOCOL}#{@host}/admin"
  end

  def stub(method, path)
    @method = method
    @url = "#{PROTOCOL}#{@host}/admin#{path}"
    self
  end

  def with_fixtures(fixture = nil)
    WebMock
      .stub(@method, @url)
      .to_return(status: 200, body: "OK")
  end
end
