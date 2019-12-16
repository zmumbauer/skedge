Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  
  root 'static_pages#landing_page'
  get 'home', to: 'static_pages#home'
  get 'typo_sample', to: 'static_pages#typography_sample'

  resources :organizations, only: [ :create, :update, :edit ]
  resources :organization_tokens, only: [ :create, :destroy ]
  resources :timeperiods, only: [ :create, :edit, :new, :update, :destroy, :index, :show ]
  resources :swap_requests, only: [ :create, :edit, :new, :update, :index, :show ]
  get 'claim_shift/:id', to: 'swap_requests#claim_shift', as: 'claim_shift'
  get 'approve_swap/:id', to: 'swap_requests#approve', as: 'approve_swap'

  get 'members', to: 'members#index'

  # Organizations
  get 'welcome_to_skedge/:id', to: 'organizations#welcome', as: 'welcome'
end
