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
    @text = Text.new(author: @user)
  end

  # POST /initiative
  def join
    @initiative = Initiative.friendly.find(params[:id])
    @user = find_or_create_actable_user
    if @user and @user.persisted?
      @user.join(@initiative)
      redirect_to @initiative, notice: t('notifications.models.user.join')
    else
      @user ||= User.new(email: user_params[:email])
      @text = Text.new(author: @user)
      flash.now[:alert] = t('errors.models.user.create')
      render :show
    end
  end

end
