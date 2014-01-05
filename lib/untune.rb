require 'nokogiri'
require 'httparty'

class Untune
  def self.get(itunes_url = "http://itunes.apple.com/us/podcast/were-alive-a-zombie-story/id313300476"
)

    response = HTTParty.get(itunes_url, :headers => {"User-Agent" => "iTunes/10.1 (Windows; U; Microsoft Windows XP Home Edition Service Pack 2 (Build 2600)) DPI/96"})

    doc = Nokogiri::HTML(response.body)

    rss_url =  "test"

    doc.css('button').each do |btn|
      rss_url = btn.attribute('feed-url') unless btn.attribute('feed-url').nil?
    end

    rss_url.value

  end
end
