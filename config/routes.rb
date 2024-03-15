Rails.application.routes.draw do

  #会員用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  #ゲストログイン機能
  devise_scope :customers do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #会員側のルーティング設定
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    get 'my_topics' => 'topics#my_index', as:'mytopics'
    resources :topics, only: [:new, :create, :index, :show, :destroy] do
      resources :topic_comments, only: [:create]
      resource :favorites, only: [:create, :destroy]
    end
    patch 'customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw'
    get 'customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    resources :customers, only: [:index, :show, :edit, :update, :destroy] do
      member do
        get :favorites
      end
    end
    resources :calendars, only: [:new, :create, :index]
    resources :foods, only: [:new, :create, :index, :destroy]
    resources :toilets, only: [:new, :create, :index, :destroy]
    get "search" => "searches#search"
    get 'tagsearches/search', to: 'tagsearches#search'
  end
  #管理者側のルーティング設定
  namespace :admin do
    root to: 'homes#top'
    resources :topics, only: [:index, :show, :edit, :update, :destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    get "search" => "searches#search"
  end
end
