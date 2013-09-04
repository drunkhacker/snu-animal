class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #  :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  has_many :posts, :class_name => "Post", :inverse_of => :author, :foreign_key => "author_id", :dependent => :destroy
  has_many :comments, :class_name => "Comment", :inverse_of => :author, :foreign_key => "author_id", :dependent => :destroy

  #Method
  def self.find_for_mysnu_oauth(email, signed_in_resource=nil)
    user = User.where(:email => email).first
    unless user
      user = User.create(email: email,
                         password:Devise.friendly_token[0,20]
                        )
    end
    user
  end
  def animal(post)
    PostAnimal.where(:post_id => post.id, :user_id => self.id).first.animal
  end
end
