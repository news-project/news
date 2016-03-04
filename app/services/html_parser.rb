require 'open-uri'

class HTMLParser
  attr_reader :url, :html, :document

  def initialize(url)
    @url = url
  end

  def content(wrap_css)
    nokogiri_html.css(wrap_css).inner_text.squish
  end

  def nokogiri_html
    @document ||= Nokogiri::HTML(fetch_html)
  end

  def fetch_html
    @html ||= begin
                open_html
              end
  end

  def open_html
    result = open(url).read
    if result.match(/charset[\=|\"]*euc-kr/i)
      result = result.force_encoding('EUC-KR').encode('UTF-8')
    end
    result
  end

  def reload
    @url, @html, @document = nil
  end
end
