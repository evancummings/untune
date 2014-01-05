require 'test/unit'
require 'untune'

class UntuneTest < Test::Unit::TestCase

  def test_xml_feed_from_itunes_link

    feed_url = "http://itunes.apple.com/us/podcast/were-alive-a-zombie-story/id313300476"
    url_regex = /https?:\/\/[\S]+/

    xml_url = Untune.get(feed_url)

    assert url_regex.match(xml_url)
    assert_equal(false, (xml_url.include? "itunes.apple.com"), "iTunes link returned instead of XML feed")

  end

  def test_url_parameter_is_validated
    feed_url = "not-a-url"
    assert_raise_with_message(RunTimeError, "Invalid URL Format") do
      Untune.get(feed_url)
    end
  end

end
