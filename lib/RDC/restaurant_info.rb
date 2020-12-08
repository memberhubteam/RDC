# frozen_string_literal: true

require_relative 'request'

module RDC
  class RestaurantInfo
    class << self
      def retrieve(restaurant_id)
        request = Request.new("/restaurant_info/#{restaurant_id}")
        response = request.get
        response.json
      end
    end
  end
end
