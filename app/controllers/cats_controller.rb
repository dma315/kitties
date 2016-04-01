class CatsController < ApplicationController

  def rankings
    @cats = Cat.all.order(elo_score: :desc)
  end

  def create
    @cat = current_user.cats.new(cat_params)
    @cat.elo_score = 1000
    @cat.save
    respond_to do |format|
      format.js {}
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:url, :thumbnail_url, :name, :terms_accepted)
  end
end