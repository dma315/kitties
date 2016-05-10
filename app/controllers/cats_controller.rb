class CatsController < ApplicationController

  include GoogleVisionHelper
  include CatsHelper

  def rankings
    @cats = Cat.order(elo_score: :desc).limit(10)
  end

  def create
    @cat = current_user.cats.new(cat_params)
    @cat.elo_score = 1000
    @cat.matchup_id = SecureRandom.uuid
    @cat.has_cat = has_cat?(@cat.url)
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
    get_random_cats(10)
    respond_to do |format|
      format.json { render json: @all_cats, include: [:owner] }
    end
    # Random SQL rows for later
    # https://www.periscopedata.com/blog/how-to-sample-rows-in-sql-273x-faster.html
  end

  def matchup
    @cat = Cat.find_by(matchup_id: params[:id])
    get_random_cats(9)
    @all_cats.unshift(@cat)
    even_number_of_cats
    respond_to do |format|
      format.html { render 'votes/new' }
      format.json { render json: @all_cats, include: [:owner] }
    end
  end

  # 138a149b-554d-41e3-9378-233f79e9904c

  private

  def cat_params
    params.require(:cat).permit(:url, :thumbnail_url, :name, :terms_accepted)
  end

end