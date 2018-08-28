Rails.application.routes.draw do
  get '/admin', to: 'admin#index', as: 'admin'
  get '/admin/:id', to: 'admin#show', as: 'user'
  root 'natillera#index', as: 'inicio'
  post 'admin/save', to: 'admin#update' , as: 'newsaves'
  # get 'admin/index'
  # root 'natillera#index'
  devise_for :users
end
