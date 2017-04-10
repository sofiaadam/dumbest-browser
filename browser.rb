# require 'net/http'
# require 'nokogiri'

require_relative 'page'

class Browser
  def run!
    # Run the browser
    # Display a prompt for a user
    puts "url> "
    url = gets.chomp
    puts "Fetching..."
    # Parse their input
    # Display useful results by instantiating
    current_url = Page.new(url)
    #   a new Page and calling methods on it.
    current_url.fetch!
    puts "Title: "
    current_url.title
    # puts "Content length: #{current_url} characters"
    puts "Links:"
    puts "#{current_url.links}"
    # Questions:
    #  1. How can a user quit the browser gracefully?
    #  2. How can a user ask for help, i.e., how do they know what commands are available to them?
  end
end

Browser.new.run!