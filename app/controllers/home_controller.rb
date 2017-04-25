class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
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
end
