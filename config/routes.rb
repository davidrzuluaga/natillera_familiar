Rails.application.routes.draw do
  get '/admin', to: 'admin#index', as: 'admin'
  get '/admin/:id', to: 'admin#show', as: 'user'
  root 'natillera#index', as: 'inicio'

  post 'admin/activity', to: 'admin#updateactivity' , as: 'activities'
  delete 'admin/activity/:id', to: 'admin#destroyactivity', as: 'activitydelete'
  get 'admin/activity/:id', to: 'admin#modifyactivity', as: 'modifyactivity'
  
  post 'admin/save', to: 'admin#updatesave' , as: 'saves'
  delete 'admin/save/:id', to: 'admin#destroysave', as: 'savedelete'
  get 'admin/save/:id', to: 'admin#modifysave', as: 'save'
  get 'admin/newsave/:id', to: 'admin#newsave', as: 'newsave'
  patch 'admin/save/:id', to: 'admin#updatemodsave', as: 'updatemodsave'
  
  post 'admin/activitylist', to: 'admin#createactivitylist' , as: 'new_activitylist'
  delete 'admin/activitylist/:id', to: 'admin#destroyactivitylist', as: 'activitylistdelete'
  
  devise_for :users

end
