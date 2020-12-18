Rails.application.routes.draw do
  root to: 'count_factorials#input'

  get 'input', to: 'count_factorials#input'
  get 'view', to: 'count_factorials#view'
  get 'view_xml_content', to: 'count_factorials#view_xml_content'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
