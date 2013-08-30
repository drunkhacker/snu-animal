class CreatePostAnimals < ActiveRecord::Migration
  def change
    create_table :post_animals do |t|
      t.integer :post_id
      t.integer :user_id
      t.integer :animal_id
      t.timestamps
    end
  end
end
