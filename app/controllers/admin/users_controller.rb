class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_filter :verify_is_admin

  def index
    @users = User.all.decorate
    @query_result = ActiveRecord::Base
                    .connection.exec_query User::SQL_QUERY
  end
  
  def new 
    @user = User.new
    @user.points_of_interests.new
  end

  def create
    @user = User.default_password(user_params)
    if @user.save
      redirect_to admin_users_path, notice: 'User created'
    else
      render :new
    end 
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'User edited'
    else
      render :edit
    end 
  end

  private
  
  def verify_is_admin
    unless current_user.admin?
      redirect_to(root_path)
    end
  end

  def user_params
    params.require(:user).permit(
      :email,
      :gender,
      :age,
      points_of_interests_attributes: [
        :id,
        :name,
        :type_of_interest,
        :points
      ]
    )
  end
end
