Rails.application.routes.draw do


  devise_for :users,skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
  }


  namespace :admin do
    resources :tags, only: [:edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :comments, only: [:index,:show, :destroy]
    resources :posts, only: [:index, :show, :edit, :destroy]
    resources :homes, only:[:top]
  end

   scope module: :public do
    post '/homes/guest_sign_in', to: 'homes#new_guest'
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :tags, only: [:create, :destroy, :edit, :update]
    resources :genres, only:[:index, :show]
    resources :posts do
      resources :comments, only: [:create,:destroy]
      resource :favoretes, only: [:create, :destroy
      ]
    end
    get "my_page" => "users#show"
    get "my_page/edit" => "users#edit"
    patch "my_page/:id/edit" => "users#:id/edit"
    resources :users, only:[:index, :show, :edit]

  end




end
