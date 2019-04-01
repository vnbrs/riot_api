require "riot_api/version"
require "riot_api/client"
require "riot_api/errors"
require "riot_api/resources/summoner"
require "riot_api/resources/champion_mastery"

module RiotAPI
  class << self
    # Sets up the initial configuration for the client to work
    # @param [String] api_key The Riot Games API key
    def configure(api_key)
      @client = Client.new(api_key)
    end

    # Resets any configuration set by +RiotAPI.configure+
    def reset!
      @client = nil
    end

    # Gets the instance of +RiotAPI::Client+. If the client hasn't been configured yet, it throws a
    # +RiotAPI::ClientNotConfiguredError+.
    # @return [RiotAPI::Client] The singleton instance of the client
    def client
      if @client.nil?
        raise ClientNotConfiguredError, "You must call RiotAPI.configure with your API key before calling the API"
      else
        @client
      end
    end
  end
end
