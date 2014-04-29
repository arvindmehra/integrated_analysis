class Property < ActiveRecord::Base

  belongs_to :user
  scope :size_between,lambda {|from,to| {:conditions => ["Property.size between ? and ?",from,to]}}
  scope :price_between,lambda {|from,to| {:conditions => ["price between ? and ?",from,to]}}
  mount_uploader :image, ImageUploader
  validates :project,:city, :area, :size, :contact, :price, :presence => true

  TODO_TYPE = {
    "Rent" => "0",
    "Sale" => "1"
  }
  PROPERTY_TYPE = {
    "Original Booking" => "0",
    "Multistorey Apartment"  => "1",
    "Builder Floor Apartment" => "2",
    "Residential House" => "3",
    "Villa" => "4",
    "Residential Plot" => "5",
    "Penthouse" => "6",
    "Studio Apartment" => "7",
    "Service Apartment" => "8",
    "Holiday Home" => "9",
    "Commercial Office Space" => "10",
    "Office in IT Park/ SEZ" => "11",
    "Commercial Shop" => "12",
    "Space in Shopping Mall" => "13",
    "Commercial Showroom" => "14",
    "Kiosk" => "15",
    "Business Centre" => "16",
    "Commercial Land" => "17",
    "Warehouse/ Godown" => "18",
    "Guest House" => "19",
    "Hotel" => "20",
    "Hotel Sites" => "21",
    "Industrial Land" => "22",
    "Industrial Building" => "23",
    "Industrial Shed" => "24"
  }

  PROFESSIONAL_TYPE = {
    "Ready to move" => "0",
    "Under Construction" => "1",
  }

  LISTING_AMENITIES = ["Parking","Garden","Gym","Lift","Power Backup","Swimming Pool","Security","Balcony"]

  BUILDING_AMENITIES = ["Rain Water Harvesting","Club House","Covered Parking","Vastu","Tiled Flooring","Terrace","Servant Quarters","Intercom","Jacuzzi","Basement","Sauna","Air Conditioned"]

  PRICING_TEXT = {
    "Lacs" => "0",
    "Crores" => "1",
    "per month (if rent)" => "2"
  }

  CITIES = {
    "Gurgaon" => "Gurgaon",
    "Mumbai" => "Mumbai",
    "Bangalore" => "Bangalore",
    "Chennai" => "Chennai",
    "Hyderabad" => "Hyderabad",
    "Pune" => "Pune",
    "Kolkata" => "Kolkata",
    "Jaipur" => "Jaipur",
    "Goa" => "Goa",
    "Lucknow" => "Lucknow",
    "Ahemdabad" => "Ahemdabad",
    "Surat" => "Surat"
  }

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
      scope = scope.select{|x| x.size.to_f >= search[:min_sqrt].to_f && x.size.to_f <= search[:max_sqrt].to_f}
    elsif search && !search[:min_sqrt].blank? && search[:max_sqrt].blank?
      scope = scope.select{|x| x.size.to_f >= search[:min_sqrt].to_f}
    elsif search && !search[:max_sqrt].blank? && search[:min_sqrt].blank?
      scope = scope.select{|x| x.size.to_f <= search[:max_sqrt].to_f}
    end
    if search && !search[:min_price].blank? && !search[:max_price].blank?
    	scope = scope.select{|x| x.size.to_f >= search[:min_price].to_f && x.size.to_f <= search[:max_price].to_f}
    elsif search && !search[:min_price].blank? && search[:max_price].blank?
      scope = scope.select{|x| x.size.to_f >= search[:min_price].to_f}
    elsif search && search[:min_price].blank? && !search[:max_price].blank?
      scope = scope.select{|x| x.size.to_f <= search[:max_price].to_f}
    end
    if search && !search[:to_do].blank?
      scope = scope.select{|x| x.to_do == search[:to_do].to_i}
    end
    if search && !search[:city].blank?
      scope = scope.select{|x| x.city == search[:city]}
    end
    scope
  end

end
