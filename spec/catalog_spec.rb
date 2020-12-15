# frozen_string_literal: true

RSpec.describe RDC::Catalog do
  describe '#get' do
    it 'makes HTTP GET request with appropriate headers' do
      RDC.ftp_url = 'ftp://some-ftp-server:22'
      RDC.ftp_username = 'bruce'
      RDC.ftp_password = 'wayne'

      # pending.
    end
  end
end
