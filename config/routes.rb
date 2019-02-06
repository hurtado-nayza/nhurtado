Rails.application.routes.draw do
  root to: 'home#index'
    devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

    resources :contacts, :except => [:edit, :update, :destroy]
end
