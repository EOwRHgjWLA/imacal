Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get "privacy" => "homes#privacy", as:"privacy"
  get "terms" => "homes#terms", as:"terms"
  get '/search', to: 'searches#search'

  resources :parties, only: [:new, :create, :index, :show, :destroy] do
    resource :like, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end



  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

end
