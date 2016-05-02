class VotesController < ApplicationController

  def new
    return if Cat.count == 0
    all_cats = Cat.all
    # @cat1 = all_cats.sample
    # @cat2 = all_cats.sample
    # while @cat1 == @cat2
    #   @cat2 = all_cats.sample
    # end
  end

  def create
    winner_id = params["winner_id"].to_i
    loser_id = params["loser_id"].to_i
    Vote.create(
      winner_id: winner_id,
      loser_id: loser_id
    )
    winner = Cat.find_by(id: winner_id)
    loser = Cat.find_by(id: loser_id)

    # p "winner score"
    winner.update_elo_score(loser, true)
    # p "loser score"
    loser.update_elo_score(winner, false)

    respond_to do |format|
      format.js { render nothing: true }
    end
  end

end