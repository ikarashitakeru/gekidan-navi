class Theater::RecruitmentsController < ApplicationController
  before_action :authenticate_theater!
  before_action :set_recruitment, only: [:show, :edit, :update, :destroy]

  def index
    @recruitments = current_theater.recruitments.order(created_at: :desc)
  end

  def show
  end

  def new
    @recruitment = current_theater.recruitments.new
  end

  def create
    @recruitment = current_theater.recruitments.new(recruitment_params)

    if @recruitment.save
      redirect_to theater_recruitment_path(@recruitment),
                  notice: "募集を投稿しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @recruitment.update(recruitment_params)
      redirect_to theater_recruitment_path(@recruitment),
                  notice: "募集情報を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recruitment.destroy

    redirect_to theater_recruitments_path,
                notice: "募集を削除しました。"
  end

  private

  def set_recruitment
    @recruitment = current_theater.recruitments.find(params[:id])
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