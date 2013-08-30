class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :author, class_name: "User" 

  has_many :animals, :through => :post_animal
  has_many :post_animals
end
