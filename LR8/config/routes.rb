Rails.application.routes.draw do
  root :to => redirect('/count_factorials/input')
  get 'count_factorials/input'
  get 'count_factorials/view'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
