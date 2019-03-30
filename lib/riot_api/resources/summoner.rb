module RiotAPI
  class Summoner
    attr_accessor :id, :account_id, :profile_icon_id, :puuid, :summoner_level, :revision_date

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
      self.from_json(response)
    end

    def self.from_json(json)
      self.new.tap do |s|
        s.id = json["id"]
        s.account_id = json["account_id"]
        s.profile_icon_id = json["profile_icon_id"]
        s.puuid = json["puuid"]
        s.summoner_level = json["summoner_level"]
        s.revision_date = json["revision_date"]
      end
    end
  end
end
