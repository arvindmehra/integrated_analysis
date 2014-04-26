class Property < ActiveRecord::Base

  belongs_to :user
  scope :size_between,lambda {|from,to| {:conditions => ["Property.size between ? and ?",from,to]}}
  scope :price_between,lambda {|from,to| {:conditions => ["price between ? and ?",from,to]}}
  TODO_TYPE = {
    "Rent" => "0",
    "Sale" => "1",
    "Original Booking" => "2"
  }

  PROFESSIONAL_TYPE = {
    "Ready to move" => "0",
    "Under Construction" => "1",
  }

  LISTING_AMENITIES = ["Parking","Garden","Gym","Lift","Power Backup","Swimming Pool","Security","Balcony"]

  BUILDING_AMENITIES = ["Rain Water Harvesting","Club House","Covered Parking","Vastu","Tiled Flooring","Terrace","Servant Quarters","Intercom","Jacuzzi","Basement","Sauna","Air Conditioned"]

  self.per_page = 10

  def self.search_data(search)
  	lc = ActiveSupport::OrderedHash.new
    lc[:min_sqrt] = []
    lc[:max_sqrt] = []
    lc[:min_price] = []
    lc[:max_price] = []
    lc[:to_do] =[]
    scope = Property.all
    if search && !search[:min_sqrt].blank? && !search[:max_sqrt].blank?
      scope = scope.select{|x| x.size >= search[:min_sqrt] && x.size <= search[:max_sqrt]}
    end
    if search && !search[:min_price].blank? && !search[:max_price].blank?
    	scope = scope.select{|x| x.size >= search[:min_price] && x.size <= search[:max_price]}
    end
    if search && !search[:to_do].blank?
      scope = scope.select{|x| x.to_do == search[:to_do]}
    end
    scope
  end

end
