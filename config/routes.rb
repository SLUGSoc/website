# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  scope '/admin' do
    resources :sponsors
    resources :rules
    resources :codes
    resources :platform_accounts
    resources :members
    resources :releases
    resources :platforms
    resources :game_event_relations
    resources :games
    resources :servers
    # Some hacky stuff here to allow /admin/events/#{id} while having the rest
    # on #{events}
    resources :events, except: %i[show update destroy], path_names: {new: 'new(/:facebook_event_id)' }
  end

  patch    'events/:id' => 'events#update'
  delete 'events/:id' => 'events#destroy'
  get    'events/:id' => 'events#show', :as => 'event'

  get '/', to: 'home#index'
  root 'home#index'
  get 'committee', to: 'home#committee'
  get 'lan', to: 'home#lan'
  get 'events', to: 'home#events', :as => 'upcoming_events'
  get 'sign_up', to: 'home#sign_up'
  get 'contact_us', to: 'home#contact_us'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
