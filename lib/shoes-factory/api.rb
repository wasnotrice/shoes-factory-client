module ShoesFactory
  module API
    def downloads
      get(downloads_url)
    end

    def all_downloads
      Download.parse(downloads.search(".download"))
    end

    def jruby_downloads
      Download.parse(downloads.at(".jruby.downloads"))
    end

    def wrapper_downloads
      downloads.at(".application-wrappers").search(".download").map do |download|
        Download.parse(download)
      end
    end
  end
end
