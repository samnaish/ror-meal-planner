Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'welcome/index'
  root 'welcome#index'
  get 'about', to: 'welcome#about', as: 'about'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
end
