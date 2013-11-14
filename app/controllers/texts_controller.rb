class TextsController < ApplicationController

  # POST /initiative/texts
  def create
    @initiative = Initiative.friendly.find(params[:initiative_id])
    @text = Text.new(text_params)
    @text.initiative = @initiative
    @text.author = author
    if @text.author.persisted? and @text.author.authorized?(current_user) and @text.save
      redirect_to @initiative, notice: t('notifications.models.text.saved')
    else
      @user = User.new
      flash.now[:alert] = t('errors.models.text.create')
      render "initiatives/show"
    end
  end


  private

  def text_params
    params.require(:text).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:email)
  end

  def author
    if user_signed_in?
      current_user
    else
      User.find_or_create_by(email: user_params[:email])
    end
  end
end
