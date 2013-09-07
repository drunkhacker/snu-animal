class AnimalCollection < ActiveRecord::Base
  belongs_to :user
  belongs_to :animal
  validates :user_id, :presence => true, :uniqueness => {:scope => :animal_id}
end
