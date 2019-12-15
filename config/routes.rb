Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  
  root 'static_pages#landing_page'

  get 'typo_sample', to: 'static_pages#typography_sample'
end
