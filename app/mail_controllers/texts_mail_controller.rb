class TextsMailController

  def create(message, params)
    current_user = User.find_or_create_by!(email: message.smtp_envelope_from)
    topic = Topic.find_by(id: params[:id])
    unless topic
      initiative = Initiative.friendly.find(params[:id])
      topic = initiative.topics.create!(name: message.subject)
    end
    text = topic.texts.create!(author: current_user, body: message.body.decoded)

    users = topic.authors + topic.initiative.members
    users.uniq.each do |user|
      TextsMailer.create(text, user).deliver unless current_user.id == user.id
    end

  rescue
    TextsMailMailer.create(message).deliver
  end

end
