require 'net/http'
require 'uri'
require 'json'

module RiotAPI
  class Client
    attr_accessor :api_key

    def initialize(api_key)
      if api_key.nil? || api_key.empty?
        raise ArgumentError, "The API key must be informed"
      end

      self.api_key = api_key
    end

    def request(method, url, params = {})
      if api_key.nil? || api_key.empty?
        raise RiotAPI::InvalidRequestError, "The API key must be informed"
      end

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
