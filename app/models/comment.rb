class Comment < ActiveRecord::Base
  #Relation
  belongs_to :post
  belongs_to :author, class_name: "User"

  #Callback
  before_save :assign_animal

  #Validation
  validates :body, :presence => true

  validates :post, :presence => true
  validates :author, :presence => true

  #Method
  def assign_animal
    if self.post_animal.nil?
      PostAnimal.create_with_post_user(self.post_id, self.author_id)
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
