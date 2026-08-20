class Theater::UsersController < ApplicationController
  before_action :authenticate_theater!

  def index
    @users = User.all

    if params[:keyword].present?
      @users = @users.where("name LIKE ?", "%#{params[:keyword]}%")
    end

    if params[:area].present?
      @users = @users.where("preferred_area LIKE ?", "%#{params[:area]}%")
    end

    @users = @users.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end
end