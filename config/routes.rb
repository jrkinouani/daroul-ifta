Rails.application.routes.draw do

  devise_for :admins, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :questions
  resources :answers, only: [:create]
  resources :validations, only: [:create]
  root "static_pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
