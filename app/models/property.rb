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
end
