json.array!(@installations) do |installation|
  json.extract! installation, :id, :name, :slug
  json.url installation_url(installation, format: :json)
end
