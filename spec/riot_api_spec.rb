RSpec.describe RiotAPI do
  it "has a version number" do
    expect(RiotAPI::VERSION).not_to be nil
  end

  describe "#client" do
    it "returns a client" do
      RiotAPI.configure "my_api_key"
      expect(RiotAPI.client).to be_a(RiotAPI::Client)
    end

    context "when #configure hasn't been called before" do
      it "throws RiotAPI::ClientNotConfiguredError" do
        expect{RiotAPI.client}.to raise_error(RiotAPI::ClientNotConfiguredError)
      end
    end
  end
end
