json.array!(@incomes) do |income|
  json.extract! income, :id, :name, :value, :user_id
  json.url income_url(income, format: :json)
end
