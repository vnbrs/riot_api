module RiotAPI
  class InvalidRequestError < StandardError; end
  class ClientNotConfiguredError < StandardError; end

  class ResponseError < StandardError
    attr_accessor :response

    def initialize(response)
      self.response = response
      super("An error has occurred during the HTTP request. Check the response for more details.")
    end
  end
end
