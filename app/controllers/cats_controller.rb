class CatsController < ApplicationController

  def rankings
    @cats = Cat.all.order(elo_score: :desc)
  end
end