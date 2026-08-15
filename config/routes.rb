Rails.application.routes.draw do
  # 認証
  devise_for :users
  devise_for :theaters

  # ユーザー側
  namespace :public do
    resources :recruitments, only: [:index, :show]
  end

  # 劇団側
  namespace :theater do
    root "homes#top"
  end

  # ユーザー側トップ
  root "public/homes#top"

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
end