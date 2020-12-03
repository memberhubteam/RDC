require "RDC/version"
require "RDC/restaurant_info"

module RDC
  class Error < StandardError; end

  class << self
    attr_accessor :api_key, :environment
  end
end
