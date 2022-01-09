Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
  devise_for :users
   root to: 'homes#top'
    get '/users/logout' => 'devise/sessions#destroy'
        resources :users,only: [:show,:index,:edit,:update, :destroy,:index]
        resources :books, only: [:new, :create, :index, :show, :edit, :destroy,:update]
        resources :book_comments, only: [:create,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
