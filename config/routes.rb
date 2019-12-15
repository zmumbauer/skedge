Rails.application.routes.draw do
  devise_for :users
  
  root 'static_pages#landing_page'

  get 'typo_sample', to: 'static_pages#typography_sample'

  resources :organizations, only: [ :create, :update ]
end
