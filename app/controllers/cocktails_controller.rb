class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
    # raise
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      # photo = params[:cocktail][:photo].original_filename
      # Cloudinary::Uploader.upload(photo)
      redirect_to @cocktail
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
