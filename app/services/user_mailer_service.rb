class UserMailerService
  def initialize(sender, recipient)
    @sender = sender
    @recipient = recipient
  end

  def send_message
    UserMailer.send_greeting(@sender, @recipient).deliver_now
  end
end