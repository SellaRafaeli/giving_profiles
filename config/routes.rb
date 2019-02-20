Rails.application.routes.draw do
  get 'giving_profiles/index'
  get 'home/index'

  root 'home#index'
end
