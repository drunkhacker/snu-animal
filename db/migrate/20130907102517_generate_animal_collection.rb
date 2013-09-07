class GenerateAnimalCollection < ActiveRecord::Migration
  def up
    # add animal collection record
    PostAnimal.all.each do |post_animal|
      ac = AnimalCollection.new(:user_id => post_animal.user_id, :animal_id => post_animal.animal_id)
      ac.save
    end
  end

  def down
    #do nothing
  end
end
