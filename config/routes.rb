Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  # ゲストユーザー
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  root to: "homes#top"

  get "home/about"=>"homes#about"

  # 検索ボタンが押された時
  get "search" => "searches#search"

  # タグ検索
  get 'tagsearches/search', to: 'tagsearches#search'

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update]do
    get "search_form" => "users#search_form"
    resource :relationships, only: [:create, :destroy]
    get :followers, on: :member
    get :followeds, on: :member
  end

  # DM
  # resources :messages, only: [:create]
  # resources :rooms, only: [:create,:show]
  get 'message/:id' => 'messages#show', as: 'message'
  resources :messages, only: [:create]

  resources :groups do
    resource :group_users, only: [:create, :destroy]
    resources :event_notices, only: [:new, :create]
    get "event_notices" => "event_notices#sent"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end