# frozen_string_literal: true

require 'RDC/request'

module RDC
  class Cart
    class << self
      def create(sku_id)
        request = Request.new("/validate_sku?sku=#{sku_id}")
        reponse = request.get
        response.json
      end
    end
  end
end
