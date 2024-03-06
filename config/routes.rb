Rails.application.routes.draw do

  #会員用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #会員側のルーティング設定
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    resources :topics, only: [:index, :show, :destroy] do
      resources :topic_comments, only: [:create]
      resources :favorites, only: [:create, :destroy]
    end
    resources :customers, only: [:index, :edit, :update]
    get 'customers/my_page' => 'customers#show', as:'mypage'
    get 'customers/unsubscribe', as:'unsubscribe'
    patch 'customers/withdraw', as:'withdraw'
    resources :calendars, only: [:new, :create, :index]
    resources :foods, only: [:new, :create, :index]
    resources :toilets, only: [:new, :create, :index]
  end
  #管理者側のルーティング設定
  namespace :admin do
    root to: 'homes#top'
    resources :topics, only: [:index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end
end
