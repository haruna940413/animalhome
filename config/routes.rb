Rails.application.routes.draw do

  #ユーザー側のルート
  scope module: :enduser do
    root to: 'homes#top'
    get 'homes/about'
    get 'homes/guide'
    resources :endusers, only: [:show, :edit, :update] do
      resources :relationships, only: [:create, :destroy, ]
    end
    get "following_user/:id" => "relationships#index_following_user", as: "following_user"
    get "follower_user/:id" => "relationships#index_follower_user", as: "follower_user"
    resources :posts, only: [:index, :new, :create, :edit, :update,  :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
     # 検索機能
     get 'search' => 'search#search'
  end

  namespace :enduser do
    devise_for :endusers, :controllers => {
      :sessions => 'endusers/sessions', :registrations => 'endusers/registrations', :passwords => 'endusers/passwords'
    }
    resources :genres, only: [:show]
    resources :pets, only: [:index, :show] do
      resources :reservations, only: [:new, :show, :create, :edit, :update, :destroy]
    end
  end

  #管理者側のルート
  scope module: :hostuser do
    get 'hostuser_homes/top'
    resources :hostusers, only: [:index]
  end

  namespace :hostuser do
    devise_for :hostusers, :controllers => {
      :sessions => 'hostusers/sessions'
     }
    resources :genres, only: [:index, :create, :edit, :update]
    resources :pets, only: [:index, :new, :create, :show, :edit, :update] do
       resources :reservation
    end
  end


end
