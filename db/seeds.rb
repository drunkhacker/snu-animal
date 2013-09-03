# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

File.readlines("./init_data/animals.txt").map {|l| l.gsub(/\n/, '')}.each do |animal_name|
  animal = Animal.new(:name => animal_name, :image_url => "http://cfile22.uf.tistory.com/image/174821464E5C807E1683DE")
  animal.save
end


