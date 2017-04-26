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
end
