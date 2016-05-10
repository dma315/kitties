class VotesController < ApplicationController

  def new
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