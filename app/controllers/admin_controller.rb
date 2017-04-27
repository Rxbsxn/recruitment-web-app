class AdminController < ApplicationController
  before_action :authenticate_user!
  before_filter :verify_is_admin

  def index
    @users = User.all.decorate
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
end
