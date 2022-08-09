Rails.application.routes.draw do


  devise_for :users
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'

  resources :books, only: [:new, :index, :show, :edit, :create, :destroy]
  resources :users, only: [:index, :edit, :show, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
