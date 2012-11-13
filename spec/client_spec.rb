require 'spec_helper'
require 'shoes-factory/client'

shared_examples "page" do
  it "is a page" do
    subject.should be_an_instance_of(Mechanize::Page)
  end
end

describe ShoesFactory::Client do
  subject { ShoesFactory::Client.new(@url) }

  its(:root_url) { should eq(@url) }
end

describe "API pages" do
  let(:client) { ShoesFactory::Client.new(@url) }

  describe "#root" do
    subject { client.root }
    it_behaves_like 'page'
  end

  describe "#downloads" do
    subject { client.root }
    it_behaves_like 'page'
  end
end
