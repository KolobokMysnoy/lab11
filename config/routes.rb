Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'index#index'
  get '/view', to: 'index#view'
  get '/all', to: 'index#all'
end
