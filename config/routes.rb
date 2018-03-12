Rails.application.routes.draw do

  devise_for :admins, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :questions do
    member do
      delete '/subcategories' => 'questions#delete_subcategories'
      delete '/keywords' => 'questions#delete_keywords'
    end
  end
  resources :keywords, only: [:index]
  resources :answers, only: [:create]
  resources :validations, only: [:create]
  root "static_pages#home"

  get "/apropos" => "static_pages#apropos"
  get "/category" => "static_pages#category"
  get "/faq" => "static_pages#faq"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
