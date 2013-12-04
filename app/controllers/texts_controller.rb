class TextsController < ApplicationController
  # POST /initiative/topics/1/texts
  def create
    @initiative = Initiative.friendly.find(params[:initiative_id])
    @topic = Topic.find(params[:topic_id])
    @text = Text.new(text_params)
    @text.topic = @topic
    @text.author = current_user

    if @text.save
      users = @topic.authors + @initiative.members
      users.uniq.each do |user|
        TextsMailer.create(@text, user).deliver unless current_user.id == user.id
      end
      flash[:notice] = t('notifications.models.text.saved')
      redirect_to initiative_topic_url(@initiative, @topic)
    else
      flash.now[:alert] = t('errors.models.text.create')
      render "topics/show"
    end
  end
end
