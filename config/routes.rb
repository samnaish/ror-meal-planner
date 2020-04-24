Rails.application.routes.draw do


  get 'welcome/index'
  root 'welcome#index'
  get 'about', to: 'welcome#about', as: 'about'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
end
