class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, class_name: "User"

  def animal
    PostAnimal.where(:post_id => self.post_id, :user_id => self.user_id).first.animal
  end
end
