require 'support/url_context'
require 'shoes-factory/client'

shared_examples "page" do
  it "is a page" do
    subject.should be_an_instance_of(Mechanize::Page)
  end
end

describe ShoesFactory::Client do
  include_context "url"
  subject { ShoesFactory::Client.new(url) }

  its(:root_url) { should eq(url) }
end

describe "API pages" do
  include_context "url"
  let(:client) { ShoesFactory::Client.new(url) }

  describe "#root" do
    subject { client.root }
    it_behaves_like 'page'
  end

  describe "#downloads" do
    subject { client.root }
    it_behaves_like 'page'
  end
end
