class AddUserIdToBudgets < ActiveRecord::Migration
  def change
    add_column :budgets, :user_id, :integer
    add_index :budgets, :user_id
  end
end
