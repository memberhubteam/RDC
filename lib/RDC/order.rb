# frozen_string_literal: true

require_relative 'request'

module RDC
  class Order
    class << self
      def process_order_body(params = {})
        request = Request.new("/process_order_body")
        response = request.post(params.merge(prti_params(params)))
        response.json
      end

      private

      def prti_params(params)
        {
          prti:        RDC.prti,
          partneradid: RDC.prti
        }
      end
    end
  end
end
