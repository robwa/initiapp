class TextsController < ApplicationController

  # POST /initiative/texts
  def create
    initiative = Initiative.friendly.find(params[:initiative_id])
    @text = Text.new(text_params)
    @text.author = current_user
    @text.initiative = initiative
    if @text.save
      redirect_to initiative
    else
      render "initiatives/show"
    end
  end


  private

  def text_params
    params.require(:text).permit(:title, :body)
  end
end
