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
    get 'admin' => 'homes#top', as: :admin_top
  end

  scope module: :public do
    root to: 'homes#top'
    resources :users, only:[:show, :edit, :update]
    resources :tags, only: [:create, :destroy, :edit, :update]
    resources :genres, only:[:index, :show]

    get 'about' => 'homes#about'
    get 'map' => 'posts#map'
    get 'nature' => 'genres#nature'
    get 'sports' => 'genres#sports'
    get 'animal' => 'genres#animal'
    get 'sky' => 'genres#sky'
    get 'fashion' => 'genres#fashion'
    get 'meal' => 'genres#meal'
    get 'night_view' => 'genres#night_view'
    get 'military' => 'genres#military'
    get 'art' => 'genres#art'
    get 'architecture' => 'genres#architecture'
    get 'portrait' => 'genres#portrait'
    get 'bw' => 'genres#bw'
    get 'vehicle' => 'genres#vehicle'
    get 'wedding' => 'genres#wedding'
    get 'other' => 'genres#other'

    resources :posts do
      resources :comments, only: [:create,:edit, :update, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get 'search' => 'posts#search'
    get 'spot_search' => 'posts#spot_search'
    get "/posts/:id/exif" => "posts#exif", as: :exif
    get '/post/user_post/:user_id' => 'posts#user_post', as: 'user_post'


  end




end
