class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.decimal :Net_Income
      t.decimal :Net_Expense
      t.references :income, index: true, foreign_key: true
      t.references :expense, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
