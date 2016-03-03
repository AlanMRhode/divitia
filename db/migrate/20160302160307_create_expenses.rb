class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.decimal :value
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
