json.array!(@addresses) do |address|
  json.extract! address, :id, :name, :address1, :address2, :city, :state, :postal_code, :country_id, :latitude, :longitude
  json.url api_v1_address_url(address, format: :json)
end
