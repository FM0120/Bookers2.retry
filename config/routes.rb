Rails.application.routes.draw do
  devise_for :users
   root to: 'homes#top'
   get '/home/about' => 'homes#about'
    get '/users/logout' => 'devise/sessions#destroy'
    resources :users do
    resource :relationships, only: [:create, :destroy]
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
    end
    
    resources :users,only: [:show,:index,:edit,:update, :destroy,:index] 
    resources :books, only: [:new, :create, :index, :show, :edit, :destroy,:update] do
        resources :book_comments, only: [:create,:destroy]
        resource :favorite, only: [:create, :destroy]
    end
end
