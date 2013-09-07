class CreateAnimalCollections < ActiveRecord::Migration
  def change
    create_table :animal_collections, :id => false do |t|
      t.integer :user_id
      t.integer :animal_id
      t.timestamps
    end

    add_index :animal_collections, [:user_id, :animal_id], :unique => true
  end
end
