module RiotAPI
  class ChampionMastery
    # Is chest granted for this champion or not in current season.
    attr_accessor :chest_granted

    # Champion level for specified player and champion combination.
    attr_accessor :champion_level

    # Total number of champion points for this player and champion combination - they are used to determine championLevel.
    attr_accessor :champion_points

    # Champion ID for this entry.
    attr_accessor :champion_id

    # Number of points needed to achieve next level. Zero if player reached maximum champion level for this champion.
    attr_accessor :champion_points_until_next_level

    # Last time this champion was played by this player - in Unix milliseconds time format.
    attr_accessor :last_play_time

    # The token earned for this champion to levelup.
    attr_accessor :tokens_earned

    # Number of points earned since current level has been achieved.
    attr_accessor :champion_points_since_last_level

    # Summoner ID for this entry. (Encrypted)
    attr_accessor :summoner_id

    # Finds the summoner mastery for a specific champion.
    # @example Find a summoner's mastery info with Irelia
    #   RiotAPI::ChampionMastery.find(region: :br, summoner_id: summoner.id, champion_id: 23)
    # @param [Hash] options The options and filters to find the mastery info
    # @option options [String] :region The League of Legends region associated with the account (e.g. +:br+, +:na+, etc)
    # @option options [String] :summoner_id The encrypted summoner ID
    # @option options [String] :champion_id The champion ID
    # @return [RiotAPI::ChampionMastery] The champion mastery info
    def self.find(options = {})
      mandatory_options = [:region, :summoner_id, :champion_id]
      unless (mandatory_options - options.keys).empty?
        raise ArgumentError, "A required parameter was not informed. The required paramaters are #{mandatory_options}"
      end

      request_url = "/lol/champion-mastery/v4/champion-masteries/by-summoner/#{options[:summoner_id]}/by-champion/#{options[:champion_id]}"
      response = RiotAPI.client.request(:get, request_url, options[:region])
      self.from_json(response)
    end

    # Finds all champion mastery information for a specific summoner.
    # @example Find a summoner's list of champion mastery
    #   RiotAPI::ChampionMastery.where(region: :br, summoner_id: summoner.id)
    # @param [Hash] options The options and filters to find the mastery info
    # @option options [String] :region The League of Legends region associated with the account (e.g. +:br+, +:na+, etc)
    # @option options [String] :summoner_id The encrypted summoner ID
    # @return [Array<RiotAPI::ChampionMastery>] A list of mastery info for each champion
    def self.where(options = {})
      mandatory_options = [:region, :summoner_id]
      unless (mandatory_options - options.keys).empty?
        raise ArgumentError, "A required parameter was not informed. The required paramaters are #{mandatory_options}"
      end

      request_url = "/lol/champion-mastery/v4/champion-masteries/by-summoner/#{options[:summoner_id]}"
      response = RiotAPI.client.request(:get, request_url, options[:region])
      response.map { |raw| self.from_json(raw) }
    end


    # Get a player's total champion mastery score, which is the sum of individual champion mastery levels.
    # @example Find a summoner total champion mastery score
    #   RiotAPI::ChampionMastery.point_sum(region: :br, summoner_id: summoner.id)
    # @param [Hash] options The options and filters to find the mastery points sum
    # @option options [String] :region The League of Legends region associated with the account (e.g. +:br+, +:na+, etc)
    # @option options [String] :summoner_id The encrypted summoner ID
    # @return [Integer] The player's total champion mastery score
    def self.score_sum(options = {})
      mandatory_options = [:region, :summoner_id]
      unless (mandatory_options - options.keys).empty?
        raise ArgumentError, "A required parameter was not informed. The required paramaters are #{mandatory_options}"
      end

      request_url = "/lol/champion-mastery/v4/scores/by-summoner/#{options[:summoner_id]}"
      response = RiotAPI.client.request(:get, request_url, options[:region])
    end

    def self.from_json(json)
      self.new.tap do |s|
        s.chest_granted = json["chestGranted"]
        s.champion_level = json["championLevel"]
        s.champion_points = json["championPoints"]
        s.champion_id = json["championId"]
        s.champion_points_until_next_level = json["championPointsUntilNextLevel"]
        s.last_play_time = json["lastPlayTime"]
        s.tokens_earned = json["tokensEarned"]
        s.champion_points_since_last_level = json["championPointsSinceLastLevel"]
        s.summoner_id = json["summonerId"]
      end
    end
  end
end
