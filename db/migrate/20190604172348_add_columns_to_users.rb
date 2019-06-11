class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :remember_created_at, :timestamp
    rename_column :users, :pic_url, :avatar_url
  end
end
