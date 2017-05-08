require 'csv'

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize! :index, current_user
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).decorate
    respond_to do |format|
      format.html
      format.csv { send_data @users.object.to_csv,
                   filename: "Users_set.csv" }
    end
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
