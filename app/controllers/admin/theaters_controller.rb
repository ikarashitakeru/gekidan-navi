class Admin::TheatersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_theater, only: [:show, :edit, :update, :destroy]

  def index
    @theaters = Theater.all
  end

  def show
  end

  def edit
  end

  def update
    if @theater.update(theater_params)
      redirect_to admin_theater_path(@theater),
                  notice: "劇団情報を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @theater.destroy
    redirect_to admin_theaters_path,
                notice: "劇団を削除しました。"
  end

  private

  def set_theater
    @theater = Theater.find(params[:id])
  end

  def theater_params
    params.require(:theater).permit(
      :name,
      :email,
      :introduction,
      :activity_area,
      :website_url
    )
  end
end