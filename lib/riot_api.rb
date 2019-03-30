require "riot_api/version"
require "riot_api/client"
require "riot_api/errors"

module RiotAPI
  class << self
    attr_accessor :client

    def configure(api_key)
      self.client = Client.new(api_key)
      return nil
    end
  end
end
