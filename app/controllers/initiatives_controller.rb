class InitiativesController < ApplicationController
  def index
    @initiative = Initiative.new
  end

  def create
    initiative = Initiative.new(initiative_params)
    initiative.save
    redirect_to initiative
  end

  def show
    @initiative = Initiative.friendly.find(params[:id])
  end

  private

  def initiative_params
    params.require(:initiative).permit(:name)
  end
end
