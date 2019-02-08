class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :fb_url
      t.string :org_type
      t.timestamps
    end
    add_index :organizations, :name, unique: true
    add_index :organizations, :fb_url, unique: true
    add_index :organizations, :org_type
  end
end
