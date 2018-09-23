Rails.application.routes.draw do
  resources :sponsors
  resources :rules
  resources :codes
  resources :platform_accounts
  resources :members
  resources :releases
  resources :platforms
  get '/', to: 'home#index'
  root 'home#index'
  get 'home/committee'
  get 'home/lan'
  get 'home/upcoming_events'
  get 'home/sign_up'
  resources :game_event_relations
  resources :events
  resources :games
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
