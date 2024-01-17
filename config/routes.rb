Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get "privacy" => "homes#privacy", as:"privacy"
  get "terms" => "homes#terms", as:"terms"

  resources :parties, only: [:new, :create, :index, :show, :destroy]

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

end
