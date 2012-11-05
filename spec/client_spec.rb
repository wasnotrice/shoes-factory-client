require 'shoes-factory-client'

describe ShoesFactory::Client do
  let(:url) { "http://example.com/spec" }
  subject { ShoesFactory::Client.new(url) }

  its(:root_url) { should eq(url) }
end
