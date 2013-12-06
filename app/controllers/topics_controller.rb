class TopicsController < ApplicationController
  before_action :create_topic, only: :create
  load_and_authorize_resource

  # POST /initiative/topics
  def create
    @initiative = Initiative.friendly.find(params[:initiative_id])
    @user = find_or_create_actable_user

    @topic.initiative = @initiative

    @text = Text.new(text_params)
    @text.author = @user
    @text.topic = @topic
    
    if @user and @user.persisted? and @topic.save and @text.save
      @initiative.members.each do |member|
        TextsMailer.create(@topic.head, member).deliver unless @user.id == member.id
      end
      redirect_to @initiative, notice: t('notifications.models.text.saved')
    else
      @user ||= User.new(email: user_params[:email])
      flash.now[:alert] = t('errors.models.text.create')
      render "initiatives/show"
    end
  end

  # GET /initiative/topics/1
  def show
    @initiative = Initiative.friendly.find(params[:initiative_id])
    @text = Text.new
  end


  private

  def create_topic
    @topic = Topic.new(topic_params)
  end
end
