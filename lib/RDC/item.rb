# frozen_string_literal: true

module RDC
  class Item
    attr_accessor :sku, :legacy_sku, :value, :price, :restriction, :restriction_detail

    def initialize(hash_values)
      puts "Hash Values :: #{hash_values}"
      @sku = hash_values['ProductSKU']
      @legacy_sku = hash_values['LegacyProductSKU']
      @value = hash_values['ItemValue']
      @price = hash_values['ItemPrice']
      @restriction = hash_values['ItemRestriction']
      @restriction_detail = hash_values['ItemRestrictionDetail']
    end
  end
end
