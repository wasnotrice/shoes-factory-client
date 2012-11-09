shared_context "url" do
  let(:html_path) { File.expand_path "../../html", __FILE__ }
  let(:url) { "file://#{html_path}/index.html" }
end


