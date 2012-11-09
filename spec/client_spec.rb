require 'shoes-factory/client'

shared_examples "page" do
  it "is a page" do
    subject.should be_an_instance_of(Mechanize::Page)
  end
end

shared_context "url" do
  let(:html_path) { File.expand_path "../html", __FILE__ }
  let(:url) { "file://#{html_path}/index.html" }
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
