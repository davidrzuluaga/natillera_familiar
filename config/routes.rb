Rails.application.routes.draw do
  root 'natillera#index', as: 'inicio'
  get '/admin', to: 'admin#index', as: 'admin'
  get '/admin/:id', to: 'admin#show', as: 'user'
  post 'admin/save', to: 'admin#updatesave' , as: 'newsaves'
  post 'admin/activity', to: 'admin#updateactivity' , as: 'newactivities'
  delete 'admin/activity/:id', to: 'admin#destroyactivity', as: 'activitydelete'
  delete 'admin/save/:id', to: 'admin#destroysave', as: 'savedelete'
  post 'admin/activitylist', to: 'admin#createactivitylist' , as: 'new_activitylist'
  delete 'admin/activitylist/:id', to: 'admin#destroyactivitylist', as: 'activitylistdelete'
  delete 'admin/debt/:id', to: 'admin#destroydebt', as: 'debtdelete'
  post 'admin/debt', to: 'admin#updatedebt' , as: 'newdebt'

  devise_for :users
end
