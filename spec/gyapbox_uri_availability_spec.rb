require "gyapbox/uri_availability"

describe Gyapbox::URI::Availability do
  subject(:availability) { Gyapbox::URI::Availability.new(uri) }
  let(:uri) { URI.parse('http://dl.dropboxusercontent.com/u/dummy/capture.png') }

  describe "#available?" do
    context "shared file is available" do
      before do
        stub_request(:head, uri.to_s).to_return(status: 200)
      end

      it "returns true" do
        expect(availability.available?).to be_true
      end
    end

    context "shared file is not uploaded yet" do
      before do
        stub_request(:head, uri.to_s).to_return(status: 404)
      end

      it "returns false" do
        expect(availability.available?).to be_false
      end
    end

    context "Dropbox is down" do
      before do
        stub_request(:head, uri.to_s).to_return(status: 500)
      end

      it "returns false" do
        expect(availability.available?).to be_false
      end
    end
  end
end
