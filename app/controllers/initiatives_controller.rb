class InitiativesController < ApplicationController

  # GET /
  def index
    @initiative = Initiative.new
    @initiatives = Initiative.all
  end

  # POST /
  def create
    @initiative = Initiative.new(initiative_params)
    if @initiative.save
      redirect_to @initiative
    else
      @initiatives = Initiative.all
      flash.now[:alert] = t('errors.models.initiative.create')
      render :index
    end
  end

  # GET /initiative
  def show
    @initiative = Initiative.friendly.find(params[:id])
  end

  # POST /initiative
  def join
    initiative = Initiative.friendly.find(params[:id])
    @user = User.find_or_create_by(email: params[:user][:email])
    if @user.persisted?
      sign_in @user
      @user.join(initiative)
      redirect_to initiative, notice: t('notifications.models.user.join')
    else
      flash.now[:alert] = t('errors.models.user.create')
      render :show
    end
  end


  private

  def initiative_params
    params.require(:initiative).permit(:name)
  end

  def user_params
    params.require(:user).permit(:email)
  end

end
