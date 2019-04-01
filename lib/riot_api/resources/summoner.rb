module RiotAPI
  class Summoner
    # Encrypted summoner ID. Max length 63 characters.
    attr_accessor :id

    # Encrypted account ID. Max length 56 characters.
    attr_accessor :account_id

    # ID of the summoner icon associated with the summoner.
    attr_accessor :profile_icon_id

    # Encrypted PUUID. Exact length of 78 characters.
    attr_accessor :puuid

    # Summoner name.
    attr_accessor :name

    # Summoner level associated with the summoner.
    attr_accessor :summoner_level

    # Date summoner was last modified specified as epoch milliseconds. The following events will update this timestamp: profile icon change, playing the tutorial or advanced tutorial, finishing a game, summoner name change
    attr_accessor :revision_date

    # The summoner associated region, e.g.: +:br+, +:na+
    attr_accessor :region

    # Finds a summoner using the Riot Games API.
    # @example Find a summoner by name
    #   RiotAPI::Summoner.find(region: :br, name: "Your Name")
    # @param [Hash] options The options and filters to find the summoner
    # @option options [String] :region The League of Legends region associated with the account (e.g. +:br+, +:na+, etc)
    # @option options [String] :name The summoner name
    # @option options [String] :id The encrypted summoner ID
    # @option options [String] :account_id The encrypted account ID
    # @option options [String] :puuid The encrypted PUUID
    # @return [RiotAPI::Summoner] The summoner that was found
    def self.find(options = {})
      mandatory_options = [:region]
      accepted_filters = [:name, :id, :account_id, :puuid]

      unless (mandatory_options - options.keys).empty?
        raise ArgumentError, "A required parameter was not informed. The required paramaters are #{mandatory_options}"
      end

      request_path = (
        if options.key?(:name)
          "/lol/summoner/v4/summoners/by-name/#{options[:name]}"
        elsif options.key?(:id)
          "/lol/summoner/v4/summoners/#{options[:id]}"
        elsif options.key?(:account_id)
          "/lol/summoner/v4/summoners/by-account/#{options[:account_id]}"
        elsif options.key?(:puuid)
          "/lol/summoner/v4/summoners/by-puuid/#{options[:puuid]}"
        else
          raise ArgumentError, "The informed filter is not accepted. The accepted filters are #{accepted_filters}"
        end
      )

      response = RiotAPI.client.request(:get, request_path, options[:region])
      instance = self.from_json(response)
      instance.region = options[:region]
      instance
    end

    def self.from_json(json)
      self.new.tap do |s|
        s.id = json["id"]
        s.account_id = json["account_id"]
        s.profile_icon_id = json["profile_icon_id"]
        s.puuid = json["puuid"]
        s.name = json["name"]
        s.summoner_level = json["summoner_level"]
        s.revision_date = json["revision_date"]
      end
    end

    # Returns a list of champion mastery for each champion
    # @return [Array<RiotAPI::ChampionMastery>]
    def masteries
      ChampionMastery.where(region: self.region, summoner_id: self.id)
    end
  end
end
