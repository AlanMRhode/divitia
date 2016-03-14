class ChangeAssetTableName < ActiveRecord::Migration
  def change
  	rename_table :assets, :user_assets
  end
end
