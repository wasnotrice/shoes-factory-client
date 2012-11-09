require 'mechanize'
require 'shoes-factory/download'

module ShoesFactory
  class Client
    DEFAULT_ROOT_URL = "http://example.com"
    def initialize(root_url = DEFAULT_ROOT_URL)
      @root_url = root_url
      @agent = Mechanize.new
    end

    attr_reader :root_url

    def get(url)
      @agent.get(url)
    end

    def root
      get(root_url)
    end

    def downloads_url
      root.at("a[@rel='downloads']")['href']
    end

    def downloads
      get(downloads_url)
    end

    def jruby_downloads
      downloads.at(".jruby.downloads")
    end

    def wrapper_downloads
      downloads.at(".application-wrappers").search(".download").map do |download|
        Download.parse(download)
      end
    end

    def package_url
      root.at("a[@rel='package']")['href']
    end

    def package
      get package_url
    end
  end
end

