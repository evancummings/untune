require 'nokogiri'
require 'httparty'

class Untune
  def self.get(itunes_url)

    if /https?:\/\/[\S]+/.match(itunes_url)

      response = HTTParty.get(itunes_url, :headers => {"User-Agent" => "iTunes/10.1 (Windows; U; Microsoft Windows XP Home Edition Service Pack 2 (Build 2600)) DPI/96"})

      doc = Nokogiri::HTML(response.body)

      rss_url =  ""

      doc.css('button').each do |btn|
        rss_url = btn.attribute('feed-url') unless btn.attribute('feed-url').nil?


        rss_url.value

      end
    else
      raise "Invalid URL Format"
    end
  end
end
