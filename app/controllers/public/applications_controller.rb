class Public::ApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recruitment, only: [:new, :create]
  before_action :set_application, only: [:show]

  def index
    @applications = current_user.applications
                                .includes(recruitment: :theater)
                                .order(created_at: :desc)
  end

  def show
  end

  def new
    @application = current_user.applications.new
  end

  def create
    @application = current_user.applications.new(application_params)
    @application.recruitment = @recruitment
    @application.selection_status = :applied

    if @application.save
      redirect_to public_application_path(@application),
                  notice: "応募が完了しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_recruitment
    @recruitment = Recruitment.find(params[:recruitment_id])
  end

  def set_application
    @application = current_user.applications.find(params[:id])
  end

  def application_params
    params.require(:application).permit(:motivation)
  end
end