json.array!(@properties) do |property|
  json.extract! property, :id, :photo, :project, :area, :city, :posted_at, :price, :size, :to_do, :contact
  json.url property_url(property, format: :json)
end
