json.array!(@admin_properties) do |admin_property|
  json.extract! admin_property, :id
  json.url admin_property_url(admin_property, format: :json)
end
