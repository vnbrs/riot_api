RSpec.describe RiotAPI::Client do
  describe "#initialize" do
    it "receives an api key" do
      instance = RiotAPI::Client.new("my_api_key")
      expect(instance.api_key).to eq("my_api_key")
    end

    context "when the api key is nil" do
      it "throws an ArgumentError" do
        expect{RiotAPI::Client.new(nil)}.to raise_error(ArgumentError)
      end
    end

    context "when the api key is empty" do
      it "throws an ArgumentError" do
        expect{RiotAPI::Client.new("")}.to raise_error(ArgumentError)
      end
    end
  end

  describe "#request" do
    context "when the region is not defined" do
      it "throws a RiotAPI::InvalidRequestError" do
        client = RiotAPI::Client.new("my_api_key")
        expect{
          client.request(:get, "/", :invalid_region)
        }.to raise_error(RiotAPI::InvalidRequestError)
      end
    end

    context "when the method is not supported" do
      it "throws a RiotAPI::InvalidRequestError" do
        client = RiotAPI::Client.new("my_api_key")
        expect{
          client.request(:destroy, "/", :br)
        }.to raise_error(RiotAPI::InvalidRequestError)
      end
    end
  end

  describe "BASE_URLS" do
    it "defines a BASE_URLS hash" do
      expect(RiotAPI::Client::BASE_URLS).to be_a(Hash)
    end

    it "has only https endpoints" do
      all_https = RiotAPI::Client::BASE_URLS.values.all? { |url| URI(url).is_a?(URI::HTTPS) }
      expect(all_https).to be true
    end
  end
end
