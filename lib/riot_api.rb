require "riot_api/version"
require "riot_api/client"
require "riot_api/errors"
require "riot_api/resources/summoner"

module RiotAPI
  class << self
    def configure(api_key)
      @client = Client.new(api_key)
      return nil
    end

    def client
      if @client
        @client
      else
        raise ClientNotConfiguredError, "You must call RiotAPI.configure with your API key before calling the API"
      end
    end
  end
end
