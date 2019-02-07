class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.references :user, foreign_key: true
      t.references :organization, foreign_key: true
      t.integer :amount
      t.timestamps
    end
    add_index :donations, [:user_id, :organization_id], unique: true
  end
end
