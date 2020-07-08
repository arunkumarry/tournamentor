Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tournaments#index'

  resources :tournaments do
  	resources :matches
  	resources :teams
  end
end
