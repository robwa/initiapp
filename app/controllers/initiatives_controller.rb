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
    @user = User.new
    @text = Text.new(author: User.new)
  end

  # POST /initiative
  def join
    @initiative = Initiative.friendly.find(params[:id])
    @user = user
    if @user.persisted? and @user.authorized?(current_user)
      @user.join(@initiative)
      redirect_to @initiative, notice: t('notifications.models.user.join')
    else
      @text = Text.new(author: @user)
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

  def user
    if user_signed_in?
      current_user
    else
      User.find_or_create_by(email: user_params[:email])
    end
  end

end
