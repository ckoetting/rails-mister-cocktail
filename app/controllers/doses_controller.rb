class DosesController < ApplicationController
  def index
    @doses = Dose.all
  end
  
  def show 
    @dose = Dose.find(params[:id])
  end

  def new 
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      redirect_to :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    @cocktail.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
