Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  
  root 'static_pages#landing_page'
  get 'home', to: 'static_pages#home'
  get 'typo_sample', to: 'static_pages#typography_sample'

  resources :organizations, only: [ :create, :update, :edit ]
  resources :timeperiods, only: [ :create, :edit, :new, :update, :destroy, :index, :show ]
  resources :swap_requests, only: [ :create, :edit, :new, :update, :index, :show ]

  # Organizations
  get 'welcome_to_skedge/:id', to: 'organizations#welcome', as: 'welcome'
end
