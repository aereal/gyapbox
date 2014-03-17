require "gyapbox/uri_builder"
require "uri"

describe Gyapbox::URI::Builder do
  describe ".build" do
    context "with Dropbox user id and path" do
      subject(:gyapbox_uri) { Gyapbox::URI::Builder.build(user_id: user_id, path: path) }
      let(:user_id) { 1234567890 }
      let(:path) { "images/capture.png" }

      it "returns an instance of URI" do
        expect(gyapbox_uri).to be_a(URI)
      end

      it "has a host that matchces dropboxusercontent.com" do
        expect(gyapbox_uri.host).to eq('dl.dropboxusercontent.com')
      end

      it "has a path that includes Dropbox user id" do
        expect(gyapbox_uri.path).to match(%r{/#{user_id}/})
      end

      it "has a path that includes image path" do
        expect(gyapbox_uri.path).to match(%r{/#{path}})
      end
    end
  end
end
