# frozen_string_literal: true

RSpec.describe RDC::Order do
  describe '#process_order_body' do
    let(:purchase_params) do
      {
        "email"                 => 'adityakapoor.mait@gmail.com',
        "sku"                   => ['600909-$10'],
        "restaurant_id"         => ['222'],
        "quantity"              => ['1'],
        "price"                 => ["4.00"],
        "partnertransactionid"  => "9094 - 47375",
      }
    end

    it 'makes HTTP POST request to make order on RDC' do
      url = 'https://dev-connect.restaurant.com/api'
      body = File.read("#{Dir.pwd}/spec/fixtures/cert.json")
      json = JSON.parse(body, symbolize_names: true).to_json
      RDC.api_key = '1234'
      RDC.prti = '1234'

      stub_request(:post, "#{url}/process_order_body")
        .with(
          body: purchase_params.merge(prti: RDC.prti, partneradid: RDC.prti).to_json,
          headers: {
            'Apikey' =>  RDC.api_key,
          }
        )
        .to_return(status: 201, body: json, headers: {})

      response = RDC::Order.process_order_body(purchase_params)
      expect(response[:processOrder][:certificates].count).to be(1)
      expect(response[:processOrder][:certificates].first[:certURI]).to eq('https://www-qa.restaurant.com/ViewCertificate?gid=30a5c908-075a-4a76-b7a9-d8ad541f10b7')
      expect(response[:processOrder][:certificates].first[:sKU]).to eq('600909-$10')
      expect(response[:processOrder][:partnerTransactionID]).to eq('9094 - 47375')
    end
  end
end
