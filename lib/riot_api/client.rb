require 'net/http'
require 'uri'
require 'json'

module RiotAPI
  class Client
    attr_accessor :api_key

    BASE_URLS = {
      # Regional endpoints
      br:	  "https://br1.api.riotgames.com",
      eune: "https://eun1.api.riotgames.com",
      euw:  "https://euw1.api.riotgames.com",
      jp:	  "https://jp1.api.riotgames.com",
      kr:	  "https://kr.api.riotgames.com",
      lan:  "https://la1.api.riotgames.com",
      las:  "https://la2.api.riotgames.com",
      na:   "https://na1.api.riotgames.com",
      oce:  "https://oc1.api.riotgames.com",
      tr:	  "https://tr1.api.riotgames.com",
      ru:	  "https://ru.api.riotgames.com",
      pbe:  "https://pbe1.api.riotgames.com",

      # Regional proxies
      americas: "https://americas.api.riotgames.com",
      europe:   "https://europe.api.riotgames.com",
      asia:     "https://asia.api.riotgames.com"
    }

    def initialize(api_key)
      if api_key.nil? || api_key.empty?
        raise ArgumentError, "The API key must be informed"
      end

      self.api_key = api_key
    end

    def request(method, path, region, params = {})
      if api_key.nil? || api_key.empty?
        raise RiotAPI::InvalidRequestError, "The API key must be informed"
      end

      base_url = BASE_URLS[region]
      if base_url.nil?
        raise RiotAPI::InvalidRequestError, "The informed region is not supported. Select one of the following: #{BASE_URLS.keys}"
      end
      url = "#{base_url}#{path}"

      uri = URI.parse(url)
      unless uri.is_a?(URI::HTTPS)
        raise RiotAPI::InvalidRequestError, "The request URL must be HTTPS"
      end

      params.merge!({ api_key: api_key })

      case method
      when :get
        request_get(uri, params)
      else
        raise RiotAPI::InvalidRequestError, "The method #{method} is not allowed"
      end
    end

    private

    def request_get(uri, params)
      uri.query = URI.encode_www_form(params)
      response = Net::HTTP.get_response(uri)

      if response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body)
      else
        raise RiotAPI::ResponseError, response
      end
    end
  end
end
