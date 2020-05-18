Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  get 'about', to: 'welcome#about', as: 'about'
  get 'search', to: 'recipes#search', as: 'search'

  resources :recipes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
end
