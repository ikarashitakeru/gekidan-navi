Rails.application.routes.draw do
  # 認証
  devise_for :users
  devise_for :theaters

  # ユーザー側
  namespace :public do
    resource :user, only: [:show, :edit, :update] do
      get :unsubscribe
      patch :withdraw
    end

    resources :recruitments, only: [:index, :show]
  end

  # 劇団側
  namespace :theater do
    root "homes#top"

    resource :theater, only: [:show, :edit, :update]
    resources :recruitments
    resources :users, only: [:index, :show]
  end

  # ユーザー側トップ
  root "public/homes#top"

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
end