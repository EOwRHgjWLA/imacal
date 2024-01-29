Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwards], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, skip: [:passwards], controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get "privacy" => "homes#privacy", as:"privacy"
  get "terms" => "homes#terms", as:"terms"
  get 'search_result', to: 'searches#search_result', as: 'search_result'

  resources :parties, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :like, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    get 'liked_parties', on: :member
  end

  namespace :admin do
    resources :weapons
    resources :users, only: [:index,:destroy]
    resources :comments, only: [:index, :destroy]
  end

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

end
