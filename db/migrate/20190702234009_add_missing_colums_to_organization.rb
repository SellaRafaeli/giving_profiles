class AddMissingColumsToOrganization < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :location, :string
    add_index :organizations, :location
    add_column :organizations, :avatar_url, :string
  end
end
