Rails.application.routes.draw do


  devise_for :users,skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
  }


  namespace :admin do
    resources :tags, only: [:index, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :comments, only: [:index,:show, :destroy]
    resources :posts, only: [:index, :show, :edit, :destroy]
  end

  scope module: :admin do
    get "admin" => "homes#top", as: :admin_top
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :tags, only: [:create, :destroy, :edit, :update]
    resources :genres, only:[:index, :show]
    get 'nature' => 'genres#nature'
    get 'sports' => 'genres#sports'
    resources :posts do
      resources :comments, only: [:create,:destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get "/posts/:id/exif" => "posts#exif", as: :exif

    resources :users, only:[:index,:show ,:edit ,:update]

  end




end
