class ShopifyMock
  PROTOCOL = "http://" # Weird compile error, this should be https
  FIXTURE_PATH = "#{__DIR__}/../fixtures/shopify"

  @host : String
  @method : Symbol
  @path : String
  @url : String
  @webmock : WebMock::Stub

  def initialize(@host)
    WebMock.reset

    # Defaults, so compiler does not complain about nil values.
    @method = :any
    @path = "/"
    @url = "#{PROTOCOL}#{@host}/admin"
    @webmock = WebMock.stub(@method, @url)
  end

  def stub(@method, @path)
    @url = "#{PROTOCOL}#{@host}/admin#{@path}"
    @webmock = WebMock.stub(@method, @url)
    self
  end

  def to_return_fixture(fixture_file = "#{@path}.json")
    json = File.read("#{FIXTURE_PATH}#{fixture_file}")
    @webmock.to_return(status: 200, body: json)
  end

  delegate to_return, to: @webmock
end
