require 'net/http'
require 'uri'

module SpecHelpers
  # Sets up root url of server to use for specs. First checks for a server at
  # http://0.0.0.0:53045 and uses that if found. Falls back to
  # spec/html/index.html
  def self.url
    html_path = File.expand_path "../html", __FILE__
    url = "http://0.0.0.0:53045"
    begin
      Net::HTTP.get URI.parse(url)
      puts "Using local server with root at #{url}"
    rescue
      url = "file://#{html_path}/index.html"
      puts "Using mock server with root at #{url}"
    end
    url
  end

  # The URL against which to run the client for all specs.
  URL = self.url
end

RSpec.configure do |config|
  config.before(:all) do
    @url = SpecHelpers::URL
  end
end
