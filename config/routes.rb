Rails.application.routes.draw do
  root 'natillera#index'
  devise_for :users
end
