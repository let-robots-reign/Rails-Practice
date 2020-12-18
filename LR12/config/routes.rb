Rails.application.routes.draw do
  root to: 'session#welcome'

  get 'welcome', to: 'session#welcome'
  get 'login', to: 'session#login'
  post 'login', to: 'session#create'
  get 'logout', to: 'session#logout'

  resources :users

  get 'input/', to: 'count_factorials#input'
  get 'view/', to: 'count_factorials#view'

  get 'view_xml_content', to: 'count_factorials#view_xml_content'
  get 'view_xml_users', to: 'count_factorials#view_xml_users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
