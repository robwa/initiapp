class DefaultMailer #< ActionMailer::Base
  def receive(message, params)
    puts "Received msg"
  end
end
