Rails.application.routes.draw do
  get 'home/index'
  root 'home#login'
  get '/about' => 'home#about'
  get '/policy' => 'home#policy'
  get '/contact' => 'home#contact'

  resources :users, only: [:show, :edit]
end
