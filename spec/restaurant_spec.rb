# frozen_string_literal: true

RSpec.describe RDC::Restaurant do
  let(:xml_file_path) { "#{Dir.pwd}/spec/fixtures/catalog.xml" }
  let(:xml) { Hash.from_xml(File.open(xml_file_path)) }

  describe '#initialize' do
    it 'sets the attributes for a restaurant' do
      restaurant_xml = xml["Catalogs"]["catalog"]
      restaurant_object = RDC::Restaurant.new(restaurant_xml)
      expect(restaurant_object.id).to eq('329357')
      expect(restaurant_object.name).to eq('Plaza Diner')
      expect(restaurant_object.short_description).to_not be_blank
      expect(restaurant_object.long_description).to_not be_blank
      expect(restaurant_object.online).to eq('false')
      expect(restaurant_object.recommended_rank).to eq('6.5306126691077893')
      expect(restaurant_object.rating).to eq('4.5219')
      expect(restaurant_object.image).to eq('https://mainsite-prod-cdn.azureedge.net/partner-images/69/mainlogo_16145logo.jpg')
      expect(restaurant_object.secondary_image).to eq('https://mainsite-prod-cdn.azureedge.net/partner-images/69/micrositeimage_16145photo1.jpg')
      expect(restaurant_object.listing_image).to eq('https://mainsite-prod-cdn.azureedge.net/partner-images/69/listingsimage_listing16145photo1.jpg')
      expect(restaurant_object.cuisines).to eq({"Primary"=>"Continental", "Secondary"=>"Fusion/Eclectic"})
      expect(restaurant_object.communication_media).to eq({"Fax"=>nil, "Phone"=>"203-9255910", "URL"=>{"MicrositeSEOUrl"=>"http://www.restaurant.com/plaza-diner-shelton-pid=69"}})
      expect(restaurant_object.additional_attributes).to eq({
        "Amenities" => "TV",
        "Atmosphere" => ["Family / Children", "Outdoor Dining"],
        "Attire" => ["No Dress Code", "Casual"],
        "Bar" => ["Full Bar", "Beer", "Wines"],
        "Cost" => "$$",
        "MealTimesServed" => ["Breakfast", "Lunch", "Dinner", "Late Night"],
        "ParkingAvailability" => "Parking on Site",
        "PaymentTypes" => ["Discover", "Mastercard", "Amex", "Visa"],
        "RedemptionMode" => "Paperless",
        "ReservationInformation" => "Not Required",
        "SpecialNeeds" => ["Smoking Section", "Child Menu", "Organic Menu Items", "Booster/High Chairs", "Non Smoking Area", "Wheelchair Access", "Early Bird Specials"],
        "TypeofServiceProvided" => ["Carry Out", "Sit Down"],
      })
      expect(restaurant_object.new_restaurant).to eq 'true'
      expect(restaurant_object.items.first.sku).to eq('DC10ATABL')
      expect(restaurant_object.items.first.legacy_sku).to eq('329357-$10')
      expect(restaurant_object.items.first.price).to eq('4')
      expect(restaurant_object.items.first.value).to eq('10')
      expect(restaurant_object.items.first.restriction).to eq('Minimum purchase of $20 at restaurant. Dine In Only.')
      expect(restaurant_object.items.first.available_inventory).to eq('16')
      expect(restaurant_object.items.first.restriction_detail).to eq({'MinPurchase'=>'20'})
      expect(restaurant_object.items.first.item_contract_type).to eq('STANDARD')
    end
  end
end
