class Property < ActiveRecord::Base

  belongs_to :user
  scope :size_between,lambda {|from,to| {:conditions => ["Property.size between ? and ?",from,to]}}
  scope :price_between,lambda {|from,to| {:conditions => ["price between ? and ?",from,to]}}
  mount_uploader :image, ImageUploader
  validates :project,:city, :area, :size, :contact, :price, :presence => true

  TODO_TYPE = {
    "Rent" => "0",
    "Sale" => "1",
    "Original Booking" => "2",
    "Multistorey Apartment"  => "3",
    "Builder Floor Apartment" => "4",
    "Residential House" => "5",
    "Villa" => "6",
    "Residential Plot" => "7",
    "Penthouse" => "8",
    "Studio Apartment" => "9",
    "Service Apartment" => "10",
    "Holiday Home" => "11",
    "Commercial Office Space" => "12",
    "Office in IT Park/ SEZ" => "13",
    "Commercial Shop" => "14",
    "Space in Shopping Mall" => "15",
    "Commercial Showroom" => "16",
    "Kiosk" => "17",
    "Business Centre" => "18",
    "Commercial Land" => "19",
    "Warehouse/ Godown" => "20",
    "Guest House" => "21",
    "Hotel" => "22",
    "Hotel Sites" => "23",
    "Industrial Land" => "24",
    "Industrial Building" => "25",
    "Industrial Shed" => "26"
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
