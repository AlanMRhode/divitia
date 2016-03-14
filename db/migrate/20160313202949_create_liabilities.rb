class CreateLiabilities < ActiveRecord::Migration
  def change
    create_table :liabilities do |t|
      t.string :name
      t.decimal :value
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
