require 'shoes-factory/client'

describe ShoesFactory::Client do
  let(:url) { "localhost:54035" }
  subject { ShoesFactory::Client.new(url) }

  its(:root_url) { should eq(url) }
end
