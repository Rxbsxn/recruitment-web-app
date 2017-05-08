class UserMailer < ApplicationMailer
  def send_greeting(sender, recipient)
    @sender = sender
    @recipient = recipient

    mail(to: @recipient.email, subject: "Greetings from #{@sender.email}" )
  end
end
