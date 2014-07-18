require 'nokogiri'
require 'open-uri'
require 'date'
class Scrape
  def initialize
      d = Date.parse(Time.now.to_s)
      todays_date = (d >> 1).strftime("%m/%d/%Y")
      url = 'http://travel.mtanyct.info/serviceadvisory/routeStatusResult.aspx?tag=6&date=' + todays_date + '&time=&method=getstatus4'
      subway_html = open(url)
      subway_doc = Nokogiri::HTML(subway_html)
      @text_body = subway_doc.css("div#divAd").children.text.strip.gsub("\r\n", " ").gsub(" \u0095", " ").gsub("_", " ").strip
  end

  def text_body
    @text_body
  end
end

