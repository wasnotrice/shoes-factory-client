require 'shoes-factory/download'

module ShoesFactory
  module API
    def all_downloads
      Download.parse(downloads.search(".download"))
    end

    def jruby_downloads
      Download.parse(downloads.at(".jruby.downloads").search(".download"))
    end

    def wrapper_downloads
      Download.parse(downloads.at(".application-wrappers").search(".download"))
    end
  end
end
