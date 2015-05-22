json.array!(@projects) do |project|
  json.extract! project, :id, :name, :slug
  json.url api_v1_project_url(project, format: :json)
end
