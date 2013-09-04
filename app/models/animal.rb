class Animal < ActiveRecord::Base
  #Validation
  validates :name, :presence => true
  #validates :image_url, :presence => true #FIXME
end
