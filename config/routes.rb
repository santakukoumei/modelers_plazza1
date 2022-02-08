Rails.application.routes.draw do
  devise_for :users
  get 'works/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "works#index"
  resources :works, only: [:new, :create, :show, :edit, :update, :destroy]
end
