Rails.application.routes.draw do
  get 'home/index'
  root 'home#login'
  get '/about' => 'home#about'
  get '/policy' => 'home#policy'
  get '/contact' => 'home#contact'
  get '/search' => 'search#index'

  resources :users, only: [:show, :edit]
end
