Rails.application.routes.draw do


  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/regstrations",
    sessions: "public/sessions"
  }

  devise_for :admins,skip: [:registrations,:passwords], controllers: {
    sessions: "admin/sessions"
  }



end
