class RatingsController < ApplicationController
  before_action :set_cocktail

  def create
    @rating = Rating.new(rating_params)
    @rating.cocktail = @cocktail

    if @rating.save
      redirect_to cocktail_path(@cocktail)
    else
      flash[:alert] = "Something went wrong."
      redirect_to cocktail_path(@cocktail)
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
