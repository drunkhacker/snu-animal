class CreatePostAnimals < ActiveRecord::Migration
  def change
    create_table :post_animals do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.belongs_to :animal
      t.timestamps
    end
  end
end
