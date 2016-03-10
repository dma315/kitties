class VotesController < ApplicationController

  def new
    @cat1 = Cat.all.sample
    @cat2 = Cat.all.sample
    while @cat1 == @cat2
      @cat2 = Cat.all.sample
    end
  end
  
end