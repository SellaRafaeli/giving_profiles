class RemoveUniquenessFromDonation < ActiveRecord::Migration[5.2]
  def change
    remove_index :donations, [:user_id, :organization_id]
    add_index :donations, [:user_id, :organization_id]
  end
end
