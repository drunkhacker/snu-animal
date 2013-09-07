class AnimalsController < ApplicationController
  before_filter :authorized?
  def collection
    @collection = AnimalCollection.where("user_id = ?", current_user.id)#.map {|ac| ac.animal}
    @taken = []

    #manupulate positions for 50 columns
    @collection.each do |elem|
      position = rand(30)
      while @taken[position] do
        position = rand(30)
      end
      @taken[position] = true
    end
  end
end
