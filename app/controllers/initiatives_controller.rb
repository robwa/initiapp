class InitiativesController < ApplicationController
  def index
    @initiatives = Initiative.all
  end

  def create
    initiative = Initiative.create(initiative_params)
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
