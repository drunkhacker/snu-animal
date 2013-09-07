class PostAnimal < ActiveRecord::Base
  #Relation
  belongs_to :user
  belongs_to :post

  belongs_to :animal

  #Validation
  validates :user, :presence => true
  validates :post, :presence => true
  validates :animal, :presence => true

  #Method
  def self.create_with_post_user(post_id, user_id)
    #randomize 
    animal = Animal.where("id NOT IN (?)", PostAnimal.where("post_id = 1").map {|x| x.animal_id}).order("random()").first
    animal_id = (!!animal && animal.id) || (rand(Animal.count) + 1) #<- in the case of animal is nil (nil occurs at first and if animals are all taken)
    self.create(:post_id => post_id, :user_id => user_id, :animal_id => animal_id)
  end
end
