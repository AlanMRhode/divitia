json.array!(@balance_sheets) do |balance_sheet|
  json.extract! balance_sheet, :id, :net_assets, :net_liabilities
  json.url balance_sheet_url(balance_sheet, format: :json)
end
