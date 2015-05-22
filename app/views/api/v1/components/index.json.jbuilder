json.array!(@components) do |component|
  json.extract! component, :id, :name, :company_id, :part_number, :serial_number
  json.url api_v1_component_url(component, format: :json)
end
