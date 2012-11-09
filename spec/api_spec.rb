require 'support/url_context'
require 'shoes-factory/client'

describe ShoesFactory::API do
  include_context "url"
  let(:client) { ShoesFactory::Client.new(url) }

  describe "#wrapper_downloads" do
    subject { client.wrapper_downloads }

    it "is an array of ShoesFactory::Download" do
      subject.first.should be_an_instance_of(ShoesFactory::Download)
    end
  end
end
