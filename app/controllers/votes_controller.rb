class VotesController < ApplicationController

  def new
    all_cats = Cat.all
    @cat1 = all_cats.sample
    @cat2 = all_cats.sample
    while @cat1 == @cat2
      @cat2 = all_cats.sample
    end
  end

  def create
    Vote.create(
      winner_id: params["winner_id"].to_i,
      loser_id: params["loser_id"].to_i
    )
    respond_to do |format|
      format.js { render nothing: true }
    end
  end

end