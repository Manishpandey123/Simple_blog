Rails.application.routes.draw do
  #devise_for :users
  #get 'posts/index'
  resources :posts
  resources :users
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end 
end
