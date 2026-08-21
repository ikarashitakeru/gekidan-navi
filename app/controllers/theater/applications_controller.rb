class Theater::ApplicationsController < ApplicationController
  before_action :authenticate_theater!
  before_action :set_application, only: [:show, :update]

  def index
    @applications = Application
                    .joins(recruitment: :theater)
                    .where(recruitments: { theater_id: current_theater.id })
                    .includes(:user, :recruitment)
                    .order(created_at: :desc)
  end

  def show
  end

  def update
    if @application.update(application_params)
      redirect_to theater_application_path(@application),
                  notice: "選考状況を更新しました。"
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_application
    @application = Application
                   .joins(recruitment: :theater)
                   .where(recruitments: { theater_id: current_theater.id })
                   .find(params[:id])
  end

  def application_params
    params.require(:application).permit(:selection_status)
  end
end