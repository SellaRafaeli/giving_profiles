class AddAvatarUrlToOrganization < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :avatar_url, :string
  end
end
