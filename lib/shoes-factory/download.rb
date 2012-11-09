module ShoesFactory
  class Download
    def self.parse(html)
      Array(html).map do |h|
        url = h.at("a[@rel='download']")['href']
        name = parse_text(h.at(".name"))
        description = parse_text(h.at(".description"))
        new(name, url, description)
      end
    end

    def self.parse_text(html)
      return html.text if html && html.respond_to?(:text)
      ''
    end

    def initialize(name, url, description = '')
      @name, @url, @description = name, url, description
    end

    attr_reader :name, :url, :description
  end
end
