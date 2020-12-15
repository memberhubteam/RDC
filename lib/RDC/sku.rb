# frozen_string_literal: true

require_relative 'request'

module RDC
  class Sku
    class << self
      def validate(sku_id)
        request = Request.new("/validate_sku/?sku=#{sku_id}")
        response = request.get
        response.json
      end

      def verify_inventory_and_price(skus)
        request = Request.new("/verify_inventory_and_price/?sku=#{skus}")
        response = request.get
        response.json
      end
    end
  end
end
