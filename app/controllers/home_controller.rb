class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).decorate
  end

  def destroy
    @user = User.find(params[:id])
    authorize! :destroy, @user
    if @user.destroy
      redirect_to root_path, notice: 'User deleted'
    else
      render :index
    end
  end

  def send_mail
    @user = User.find_by(id: params[:user_id])
    if UserMailerService.new(current_user, @user).send_message
      redirect_to root_path, notice: 'Email Sent'
    else
      redirect_to root_path, notice: 'Something go wrong'
    end
  end
end
