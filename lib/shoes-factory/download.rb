module ShoesFactory
  class Download
    def self.parse(html)
      url = html.at("a[@rel='download']")['href']
      name = parse_text(html.at(".name"))
      description = parse_text(html.at(".description"))
      new(name, url, description)
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
