Rails.application.routes.draw do
  root to: 'session#welcome'

  get 'session/welcome'
  get 'session/login'
  post 'session/create'
  get 'session/logout'

  resources :users

  get 'input/', to: 'count_factorials#input'
  get 'view/', to: 'count_factorials#view'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
