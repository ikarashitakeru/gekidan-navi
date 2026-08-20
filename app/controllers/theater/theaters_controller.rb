class Theater::TheatersController < ApplicationController
  before_action :authenticate_theater!

  def show
    @theater = current_theater
  end

  def edit
    @theater = current_theater
  end

  def update
    @theater = current_theater

    if @theater.update(theater_params)
      redirect_to theater_theater_path, notice: "劇団情報を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def theater_params
    params.require(:theater).permit(
      :name,
      :introduction,
      :activity_area,
      :website_url
    )
  end
end