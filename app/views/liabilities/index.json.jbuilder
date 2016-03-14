json.array!(@liabilities) do |liability|
  json.extract! liability, :id, :name, :value, :user_id
  json.url liability_url(liability, format: :json)
end
