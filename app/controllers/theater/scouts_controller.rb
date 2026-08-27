class Theater::ScoutsController < ApplicationController
  before_action :authenticate_theater!
  before_action :set_user, only: [ :new, :create ]

  def index
    @scouts = current_theater.scouts.includes(:user, :recruitment)
  end

  def show
    @scout = current_theater.scouts.find(params[:id])
  end

  def new
    @scout = current_theater.scouts.new(user: @user)

    @recruitments = current_theater.recruitments.where(status: :open)
  end

  def create
    @scout = current_theater.scouts.new(scout_params)
    @scout.user = @user
    @scout.status = :sent

    if @scout.save
      redirect_to theater_scout_path(@scout),
                  notice: "スカウトを送信しました。"
    else
      @recruitments = current_theater.recruitments.where(status: :open)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def scout_params
    params.require(:scout).permit(
      :recruitment_id,
      :message
    )
  end
end
