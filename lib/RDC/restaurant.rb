# frozen_string_literal: true

require_relative 'item'

module RDC
  class Restaurant
    attr_accessor :name, :items, :short_description, :long_description,
                  :online, :address, :image

    def initialize(hash_values)
      puts "Initializing Restaurant #{hash_values['RestaurantName']}"
      @name = hash_values['RestaurantName']
      @short_description = hash_values['ShortDescription']
      @long_description = hash_values['LongDescription']
      @online = hash_values['OnlineReservation']

      @address = hash_values['LocationAddress']
      @image = hash_values.dig('CatalogImagesFullPath', 'MainLogo')
      @items = Array.wrap(hash_values.dig('Items', 'Item')).collect { |item_hash| RDC::Item.new(item_hash) }
    end
  end
end
