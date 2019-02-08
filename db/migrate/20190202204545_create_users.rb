class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :nick_name
      t.string :fb_id
      t.string :email
      t.string :favorite_cause
      t.string :favorite_cause_description
      t.string :philosophy 
      t.string :address
      t.integer :yearly_income
      t.string :pic_url
      t.boolean :deleted, default: false, null: false
      t.timestamps
    end
    add_index :users, :name
    add_index :users, :email, unique: true
    add_index :users, :fb_id, unique: true
    add_index :users, :yearly_income
    add_index :users, :favorite_cause
  end

end
