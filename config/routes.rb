Rails.application.routes.draw do
  get '/admin', to: 'admin#index', as: 'admin'
  get '/admin/:id', to: 'admin#show', as: 'user'
  root 'natillera#index', as: 'inicio'
  post 'admin/save', to: 'admin#updatesave' , as: 'newsaves'
  post 'admin/activity', to: 'admin#updateactivity' , as: 'newactivities'
  delete 'admin/activity/:id', to: 'admin#destroyactivity', as: 'activitydelete'
  delete 'admin/save/:id', to: 'admin#destroysave', as: 'savedelete'
  # get 'admin/index'
  # root 'natillera#index'
  devise_for :users
end
