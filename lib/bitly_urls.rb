# Docs - https://www.rubydoc.info/gems/bitly/
class BitlyUrls
  def initialize
    @client = Bitly::API::Client.new(token: Rails.application.credentials[:bitly][:access_token])
  end

  def shorten_link(url)
    new_url = @client.shorten(long_url: url)
    new_url.link
  end
end
