# frozen_string_literal: true

require_relative 'request'

module RDC
  class Order
    class << self
      def process_order_body(params = {})
        request = Request.new("/process_order_body")
        response = request.post(params)
        response.json
      end
    end
  end
end
