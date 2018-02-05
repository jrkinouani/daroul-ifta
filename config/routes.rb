Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins
  resources :questions
  root "static_pages#home"

  get "/apropos" => "static_pages#apropos"
  get "/faq" => "static_pages#faq"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
