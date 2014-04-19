class Property < ActiveRecord::Base

	TODO_TYPE = {
    "Rent" => "0",
    "Sale" => "1",
    "Purchase" => "2"
  }

  PROFESSIONAL_TYPE = {
    "Ready to move" => "0",
    "Under Construction" => "1",
  }

  LISTING_AMENITIES = ["Kitchen","Showers","Patio","Reception","Ready to move in","Furniture","Natural light","High ceilings"]

  BUILDING_AMENITIES = ["Parking garage","Lobby attendant","Gym","Common kitchen","Common bike storage","Common showers","Onsite parking","Bikes allowed","Dog friendly","Common bathrooms","Onsite security guard"]

  self.per_page = 10

end
