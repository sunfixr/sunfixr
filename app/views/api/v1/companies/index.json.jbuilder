json.array!(@companies) do |company|
  json.extract! company, :id, :name
  json.url api_v1_company_url(company, format: :json)
end
