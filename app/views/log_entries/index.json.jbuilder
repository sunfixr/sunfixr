json.array!(@log_entries) do |log_entry|
  json.extract! log_entry, :id, :user, :component_id, :comments
  json.url log_entry_url(log_entry, format: :json)
end
