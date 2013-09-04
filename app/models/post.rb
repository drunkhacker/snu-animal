class Post < ActiveRecord::Base
  #Relation
  has_many :comments
  belongs_to :author, class_name: "User" 

  has_many :post_animals
  has_many :animals, :through => :post_animals

  #Validation
  validates :title, :presence => true
  validates :body, :presence => true

  validates :author, :presence => true
end
