require "RDC/version"
require "RDC/catalog"
require "RDC/restaurant_info"

module RDC
  class Error < StandardError; end

  class << self
    attr_accessor :api_key, :environment
    attr_accessor :ftp_username, :ftp_password, :ftp_url

    def root
      File.dirname __dir__
    end
  end
end
