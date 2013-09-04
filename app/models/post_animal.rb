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
    animal_id = rand(Animal.count) + 1
    self.create(:post_id => post_id, :user_id => user_id, :animal_id => animal_id)
  end
end
