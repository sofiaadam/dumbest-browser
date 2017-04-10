require 'nokogiri'
require 'open-uri'
require 'net/http'

class Page
  # attr_reader :title, :url, :links, :paragraph, :char_count
  def initialize(url)
    @url = url
  end
  
  def fetch!
    uri = URI(@url)
    res = Net::HTTP.get_response(uri)
    @doc = Nokogiri::HTML(res.body)
  end
  
  def title
    p @doc.css('title').text
  end
  
  def links
    @links = []
    find_link = @doc.search("a").map { |tag| tag["href"]}
    find_link.map! {|link|}
    if link.start_with?"http://"
      @link << link
    end
    # Research alert!
    # How do you use Nokogiri to extract all the link URLs on a page?
    #
    # These should only be URLs that look like
    #   <a href="http://somesite.com/page.html">Click here!</a>
    # This would pull out "http://somesite.com/page.html"
  end
end



