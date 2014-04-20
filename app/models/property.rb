class Property < ActiveRecord::Base

	scope :size_between,lambda {|from,to| {:conditions => ["Property.size between ? and ?",from,to]}}
	scope :price_between,lambda {|from,to| {:conditions => ["price between ? and ?",from,to]}}
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

  def self.search_data(search)
  	lc = ActiveSupport::OrderedHash.new
    lc[:min_sqrt] = []
    lc[:max_sqrt] = []
    lc[:min_price] = []
    lc[:max_price] = []
    lc[:to_do] =[]
    scope = Property.all
    if search && !search[:min_sqrt].blank? && !search[:max_sqrt].blank?
      scope = scope.where{|x| x.size >= search[:min_sqrt] && x.size <= search[:max_sqrt]}
      scope = scope.instance_values.values.last
    end
    if search && !search[:min_price].blank? && !search[:max_price].blank?
    	scope = scope.where{|x| x.size >= search[:min_price] && x.size <= search[:max_price]}
    	scope = scope.instance_values.values.last
    end
    if search && !search[:to_do].blank?
      scope = scope.where{|x| x.to_do == search[:to_do]}
      scope = scope.instance_values.values.last
    end
    scope
  end

end
