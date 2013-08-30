class PostAnimal < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  belongs_to :animal
end
