class CatsController < ApplicationController

  include GoogleVisionHelper

  def rankings
    @cats = Cat.order(elo_score: :desc).limit(10)
  end

  def create
    @cat = current_user.cats.new(cat_params)
    @cat.elo_score = 1000
    p @cat.has_cat = has_cat?(@cat.url)
    @cat.save
    respond_to do |format|
      format.js {}
    end
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update_attributes(cat_params)
    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy
    redirect_to edit_user_path(current_user)
  end

  def random_cats
    return if Cat.count == 0
    @all_cats = Cat.limit(10).order("RANDOM()") # Make this the query below
    respond_to do |format|
      format.json { render json: @all_cats, include: [:owner] }
    end
    # Random SQL rows for later
    # https://www.periscopedata.com/blog/how-to-sample-rows-in-sql-273x-faster.html
  end

  private

  def cat_params
    params.require(:cat).permit(:url, :thumbnail_url, :name, :terms_accepted)
  end
end