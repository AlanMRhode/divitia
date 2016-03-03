json.array!(@budgets) do |budget|
  json.extract! budget, :id, :Net_Income, :Net_Expense, :income_id, :expense_id
  json.url budget_url(budget, format: :json)
end
