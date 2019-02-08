class CreateUserFavoriteOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_favorite_organizations do |t|
      t.references :user, foreign_key: true
      t.references :organization, foreign_key: true
      t.string :description
      t.timestamps
    end
    ## custom index name because rails generated name was too long. 
    add_index :user_favorite_organizations, [:user_id, :organization_id], unique: true, name: "index_user_fav_orgs_on_user_id_and_org_id"

  end
end
