class TextsController < ApplicationController

  # POST /initiative/texts
  def create
    initiative = Initiative.friendly.find(params[:initiative_id])
    @text = Text.new(text_params)
    @text.initiative = initiative
    if user_signed_in?
      @text.author = current_user
    else
      @text.author = User.find_or_create_by(email: params[:user][:email])
    end
    if @text.author.persisted? and @text.save
      redirect_to initiative, notice: t('notifications.models.text.saved')
    else
      flash.now[:alert] = t('errors.models.text.create')
      render "initiatives/show"
    end
  end


  private

  def text_params
    params.require(:text).permit(:title, :body)
  end
end
