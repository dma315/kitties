class CatsController < ApplicationController

  def rankings
    @cats = Cat.order(elo_score: :desc).limit(10)
  end

  def create
    @cat = current_user.cats.new(cat_params)
    @cat.elo_score = 1000
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

  private

  def cat_params
    params.require(:cat).permit(:url, :thumbnail_url, :name, :terms_accepted)
  end
end