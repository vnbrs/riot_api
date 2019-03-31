require "riot_api/version"
require "riot_api/client"
require "riot_api/errors"
require "riot_api/resources/summoner"

module RiotAPI
  class << self
    def configure(api_key)
      @client = Client.new(api_key)
    end

    def client
      if @client.nil?
        raise ClientNotConfiguredError, "You must call RiotAPI.configure with your API key before calling the API"
      else
        @client
      end
    end

    def reset!
      @client = nil
    end
  end
end
