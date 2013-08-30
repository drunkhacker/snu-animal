class User < ActiveRecord::Base
  has_many :posts

  def animal(post)
    PostAnimal.where(:post_id => post.id, :user_id => self.id).first.animal
  end
end
