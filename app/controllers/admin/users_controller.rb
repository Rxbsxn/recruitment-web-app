class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_filter :verify_is_admin

  def index
    @users = User.all.decorate
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
  end
  
  def update
    if @user = User.update(user_params)
      redirect_to admin_users_path, notice: 'User edited'
    else
      render :edit
    end 
  end

  private
  
  def verify_is_admin
    if current_user.nil?
      redirect_to(root_path)
    else
      unless current_user.admin?
        redirect_to(root_path)
      end
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
        :type,
        :points
      ]
    )
  end
end
