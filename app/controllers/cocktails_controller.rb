class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    # @cocktails = Cocktail.all
    if params[:query].present?
      @search = "#{params[:query][:search]} #{params[:query][:filter]}"
      @cocktails = Cocktail.search_by_name(@search)
      # respond_to do |format|
      #   format.html
      #   format.json { render json: { restaurants: @restaurants } }
      # end
      respond_to do |format|
        format.html
        format.js
      end
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
    @rating = Rating.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:cocktail).permit(:name, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
