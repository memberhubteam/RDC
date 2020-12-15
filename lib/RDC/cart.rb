# frozen_string_literal: true

require 'RDC/request'

module RDC
  class Cart
    class << self
      def create(params)
        request = Request.new("/create_shopping_cart_id")
        reponse = request.get(params)
        response.json
      end
    end
  end
end
