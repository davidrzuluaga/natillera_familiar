Rails.application.routes.draw do
  devise_for :users

  root 'natillera#index', as: 'inicio'
  
  get '/admin', to: 'admin#index', as: 'admin'
  get '/admin/:id', to: 'admin#show', as: 'user'
  
  post 'admin/save/:id', to: 'admin#createsave' , as: 'saves'
  delete 'admin/save/:id', to: 'admin#destroysave', as: 'savedelete'
  get 'admin/newsave/:id', to: 'admin#newsave', as: 'newsave'
  get 'admin/save/:id', to: 'admin#modifysave', as: 'safe'
  patch 'admin/save/:id', to: 'admin#updatesave', as: 'updatesave'
  
  post 'admin/activity/:id', to: 'admin#createactivity' , as: 'activities'
  delete 'admin/activity/:id', to: 'admin#destroyactivity', as: 'activitydelete'
  get 'admin/newactivity/:id', to: 'admin#newactivity', as: 'newactivity'
  get 'admin/activity/:id', to: 'admin#modifyactivity', as: 'activity'
  patch 'admin/activity/:id', to: 'admin#updateactivity', as: 'updateactivity'
  
  post 'admin/activitylist', to: 'admin#createactivitylist' , as: 'new_activitylist'
  delete 'admin/activitylist/:id', to: 'admin#destroyactivitylist', as: 'activitylistdelete'

  post 'admin/debt/:id', to: 'admin#createdebt' , as: 'debts'
  delete 'admin/debt/:id', to: 'admin#destroydebt', as: 'debtdelete'
  get 'admin/newdebt/:id', to: 'admin#newdebt', as: 'newdebt'
  get 'admin/debt/:id', to: 'admin#modifydebt', as: 'debt'
  patch 'admin/debt/:id', to: 'admin#updatedebt', as: 'updatedebt'
end

