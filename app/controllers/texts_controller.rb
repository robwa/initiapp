class TextsController < ApplicationController

  # POST /initiative/texts
  def create
    @initiative = Initiative.friendly.find(params[:initiative_id])
    @user = user
    @text = Text.new(text_params.merge({ initiative: @initiative, author: @user }))
    if @user.persisted? and @user.authorized?(current_user) and @text.save
      TextsMailer.create_notification(@text).deliver
      redirect_to @initiative, notice: t('notifications.models.text.saved')
    else
      flash.now[:alert] = t('errors.models.text.create')
      render "initiatives/show"
    end
  end

end
