class Admin::RecruitmentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_recruitment,
                only: [ :show, :edit, :update, :destroy ]

  def index
    @recruitments = Recruitment.includes(:theater).all
  end

  def show
  end

  def edit
  end

  def update
    if @recruitment.update(recruitment_params)
      redirect_to admin_recruitment_path(@recruitment),
                  notice: "募集情報を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recruitment = Recruitment.find(params[:id])
    @recruitment.destroy

    redirect_to admin_recruitments_path,
                notice: "募集を削除しました。"
  end

  private

  def set_recruitment
    @recruitment = Recruitment.find(params[:id])
  end

  def recruitment_params
    params.require(:recruitment).permit(
      :title,
      :description,
      :capacity,
      :deadline,
      :activity_area,
      :status
    )
  end
end
