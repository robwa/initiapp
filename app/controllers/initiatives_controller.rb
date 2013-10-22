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

  # def join
  #   initiative = Initiative.friendly.find(params[:id])
  #   user = User.create(user_params)

  #   user.join(initiative)

  #   redirect_to initiative
  # end


  private

  def initiative_params
    params.require(:initiative).permit(:name)
  end

  def user_params
    params.require(:user).permit(:email)
  end

end
