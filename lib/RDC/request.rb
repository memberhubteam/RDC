# frozen_string_literal: true

require 'http'

module RDC
  class Request
    def initialize(path)
      @path = path
    end

    attr_accessor :path, :response, :json

    def base_url
      if RDC.environment == 'production'
        'http://connect.restaurant.com/api'.freeze
      else
        'https://dev-connect.restaurant.com/api'.freeze
      end
    end

    def get(params = {})
      self.response = HTTP.headers(headers)
                          .get(url, { params: params })
      self.json = JSON.parse(response.body.to_s, symbolize_names: true)
      self
    end

    def post(params = {})
      self.response = HTTP.headers(headers)
                          .post(url, { json: params })
      self.json = JSON.parse(response.body.to_s, symbolize_names: true)
      self
    end

    def url
      "#{base_url}#{path}"
    end

    private

    def headers
      {
        apikey: RDC.api_key
      }
    end
  end
end
