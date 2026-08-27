class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def toggle_status
    @user = User.find(params[:id])
    @user.update!(is_active: !@user.is_active)

    redirect_to admin_user_path(@user)
  end
end