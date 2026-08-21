class Public::RecruitmentsController < ApplicationController
  def index
    @recruitments = Recruitment.includes(:theater)
                               .order(created_at: :desc)
  end

  def show
    @recruitment = Recruitment.find(params[:id])
  end
end