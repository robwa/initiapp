class TextsMailer < ActionMailer::Base
  def create(text, user)
    @text = text
    subject = "[#{@text.initiative.slug}] #{@text.topic.name}"
    unless @text.id == @text.topic.head.id
      subject.prepend("Re: ")
    end
    
    domain = ActionMailer::Base::default[:from].split('@').last
    mail(from: "#{@text.topic.id}@#{domain}", to: user.email, subject: subject)
  end
end
