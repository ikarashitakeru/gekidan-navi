class Public::ScoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_scout, only: [:show, :accept, :decline]

  def index
    @scouts = current_user.scouts
                          .includes(:theater, :recruitment)
                          .order(created_at: :desc)
  end

  def show
  end

  def accept
    if @scout.update(status: :accepted)
      redirect_to public_scout_path(@scout),
                  notice: "スカウトを承諾しました。"
    else
      redirect_to public_scout_path(@scout),
                  alert: "スカウトの承諾に失敗しました。"
    end
  end

  def decline
    if @scout.update(status: :declined)
      redirect_to public_scout_path(@scout),
                  notice: "スカウトを辞退しました。"
    else
      redirect_to public_scout_path(@scout),
                  alert: "スカウトの辞退に失敗しました。"
    end
  end

  private

  def set_scout
    @scout = current_user.scouts.find(params[:id])
  end
end