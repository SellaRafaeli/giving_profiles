class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false do |t|
      t.string :id
      t.string :name
      t.timestamps
      t.index :id, unique: true
    end
  end
end
