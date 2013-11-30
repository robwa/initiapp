class TextsController < ApplicationController

  # POST /initiative/texts
  def create
    @initiative = Initiative.friendly.find(params[:initiative_id])
    @user = find_or_create_actable_user
    @text = Text.new(text_params.merge({ initiative: @initiative, author: @user }))
    
    if @user and @user.persisted? and @text.save
      @initiative.members.each do |member|
        TextsMailer.create(@text, member).deliver unless @user.id == member.id
      end
      redirect_to @initiative, notice: t('notifications.models.text.saved')
    else
      @user ||= User.new(email: user_params[:email])
      flash.now[:alert] = t('errors.models.text.create')
      render "initiatives/show"
    end
  end

  # GET /initiative/texts/1
  def show
    @text = Text.find(params[:id])
  end

end
