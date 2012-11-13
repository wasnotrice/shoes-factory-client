require 'spec_helper'
require 'shoes-factory/client'

shared_examples "downloads" do
  it "is an array of ShoesFactory::Download" do
    subject.first.should be_an_instance_of(ShoesFactory::Download)
  end
end

describe ShoesFactory::API do
  let(:client) { ShoesFactory::Client.new(@url) }

  describe "#wrapper_downloads" do
    subject { client.wrapper_downloads }

    it_behaves_like "downloads"
  end

  describe "#jruby_downloads" do
    subject { client.jruby_downloads }

    it_behaves_like "downloads"
  end

  describe "#all_downloads" do
    subject { client.all_downloads }

    it_behaves_like "downloads"
  end
end
