json.array!(@assets) do |asset|
  json.extract! asset, :id, :name, :value, :user_id
  json.url asset_url(asset, format: :json)
end
