# frozen_string_literal: true

require_relative 'item'

module RDC
  class Restaurant
    attr_accessor :name, :items, :short_description, :long_description,
                  :online, :address, :image, :id, :communication_media,
                  :recommended_rank, :rating, :cuisines, :additional_attributes,
                  :secondary_image, :listing_image, :new_restaurant

    def initialize(hash_values)
      @id = hash_values['LegacyRestaurantId']
      @name = hash_values['RestaurantName']
      @short_description = hash_values['ShortDescription']
      @long_description = hash_values['LongDescription']
      @online = hash_values['OnlineReservation']
      @recommended_rank = hash_values['RecommendedRank']
      @rating = hash_values['Rating']
      @cuisines = hash_values['Cuisine']
      @additional_attributes = hash_values['Attributes']

      @address = hash_values['LocationAddress']
      @communication_media = hash_values['CommunicationMedia']
      @image = hash_values.dig('CatalogImagesFullPath', 'MainLogo')
      @secondary_image = hash_values.dig('CatalogImagesFullPath', 'MicrositeImage1')
      @listing_image = hash_values.dig('CatalogImagesFullPath', 'ListingsImage')
      @new_restaurant = hash_values.dig('Dates', 'NewRestaurantAdded') || false
      @items = Array.wrap(hash_values.dig('Items', 'Item')).collect { |item_hash| RDC::Item.new(item_hash) }
    end
  end
end
