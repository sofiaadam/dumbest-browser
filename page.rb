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
  # def calculate_word_count
  # end
  
  
  def links
    @links = []
    @doc.css("a").each do |y|
      next unless y[:href].include? "http://"
      @links << y[:href]
    end
    @links
  end
end

