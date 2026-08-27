class Public::RecruitmentsController < ApplicationController
  def index
    @recruitments = Recruitment.includes(:theater, :genre)
                               .order(created_at: :desc)

    # キーワード検索
    if params[:keyword].present?
      keyword = "%#{ActiveRecord::Base.sanitize_sql_like(params[:keyword])}%"

      @recruitments = @recruitments
        .left_joins(:theater)
        .where(
          "recruitments.title LIKE :keyword OR theaters.name LIKE :keyword",
          keyword: keyword
        )
    end

    # 活動地域検索
    if params[:area].present?
      @recruitments = @recruitments.where(
        activity_area: params[:area]
      )
    end

    # ジャンル検索
    if params[:genre_id].present?
      @recruitments = @recruitments.where(
        genre_id: params[:genre_id]
      )
    end

    @genres = Genre.order(:name)
  end

  def show
    @recruitment = Recruitment.find(params[:id])
  end
end
