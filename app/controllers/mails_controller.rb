class MailsController < ApplicationController
  before_action :authenticate_user!
  
  def send_mail
    @user = User.find_by(id: params[:user_id])
    if UserMailerService.new(current_user, @user).send_message
      redirect_to root_path, notice: 'Email Sent'
    else
      redirect_to root_path, notice: 'Something go wrong'
    end
  end
end
