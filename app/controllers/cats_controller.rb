class CatsController < ApplicationController

  def rankings
    @cats = Cat.all.order(elo_score: :desc)
  end

  def create
    @cat = current_user.cats.new(cat_params)
    respond_to do |format|
      if @cat.save
        format.js {}
      else
        format.js {}
      end
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:url, :thumbnail_url, :name, :terms_accepted)
  end
end