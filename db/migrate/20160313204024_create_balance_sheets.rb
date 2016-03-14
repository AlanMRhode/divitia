class CreateBalanceSheets < ActiveRecord::Migration
  def change
    create_table :balance_sheets do |t|
      t.decimal :net_assets
      t.decimal :net_liabilities

      t.timestamps null: false
    end
  end
end
