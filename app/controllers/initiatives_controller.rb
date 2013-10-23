class InitiativesController < ApplicationController

  # GET /
  def index
    @initiatives = Initiative.all
  end

  # POST /
  def create
    initiative = Initiative.create(initiative_params)
    redirect_to initiative
  end

  # GET /initiative
  def show
    @initiative = Initiative.friendly.find(params[:id])
  end

  # POST /initiative
  def join
    initiative = Initiative.friendly.find(params[:id])
    user = User.create(user_params)

    user.join(initiative)

    redirect_to initiative
  end


  private

  def initiative_params
    params.require(:initiative).permit(:name)
  end

  def user_params
    params.require(:user).permit(:email)
  end

end
