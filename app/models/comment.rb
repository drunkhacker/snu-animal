class Comment < ActiveRecord::Base
  #Relation
  belongs_to :post
  belongs_to :author, class_name: "User", :inverse_of => :posts

  #Callback
  before_save :assign_animal

  #Validation
  validates :body, :presence => true

  validates :post, :presence => true
  validates :author, :presence => true

  #Method
  def assign_animal
    if self.post_animal.nil?
      pa = PostAnimal.create_with_post_user(self.post_id, self.author_id)
      #assign animal collection
      ac = AnimalCollection.new(:user_id => self.author_id, :animal_id => pa.animal_id)
      begin
        ac.save
      rescue Error => e
        logger.debug e.message
      end
      pa
    end
  end

  def post_animal
    PostAnimal.where(:post_id => self.post_id, :user_id => self.author_id).first
  end

  def animal
    p = post_animal
    p.nil? ? nil : p.animal
  end
end
