Rails.application.routes.draw do
  # 認証
  devise_for :admins
  devise_for :users
  devise_for :theaters

  # 管理者側
  namespace :admin do
    root "homes#top"

    resources :users, only: [:index, :show] do
      member do
        patch :toggle_status
      end
    end

    resources :theaters,
              only: [:index, :show, :edit, :update, :destroy]

    resources :recruitments,
              only: [:index, :show, :edit, :update, :destroy]

    resources :genres, except: [:show]
  end

  # ユーザー側
  namespace :public do
    resource :user, only: [:show, :edit, :update] do
      get :unsubscribe
      patch :withdraw
    end

    resources :recruitments, only: [:index, :show] do
      resources :applications, only: [:new, :create]
    end

    resources :applications, only: [:index, :show]

    # 受信したスカウト
    resources :scouts, only: [:index, :show] do
      member do
        patch :accept
        patch :decline
      end
    end
  end

  # 劇団側
  namespace :theater do
    root "homes#top"

    resource :theater, only: [:show, :edit, :update]

    resources :recruitments

    resources :users, only: [:index, :show] do
      # ユーザーへスカウトを送る
      resources :scouts, only: [:new, :create]
    end

    resources :applications, only: [:index, :show, :update]

    # 送信したスカウト一覧・詳細
    resources :scouts, only: [:index, :show]
  end

  # ユーザー側トップ
  root "public/homes#top"

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
end