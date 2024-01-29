
Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'home#index' 

  resources :otp, only: [:index, :create, :show]
 
  resources :posts 
  resources :likes
  resources :postcomments
end
