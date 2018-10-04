Rails.application.routes.draw do
  devise_for :writers, path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'signup',
  }

  # devise_for :admins, path: 'admins'
  devise_for :admins, path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'signup',
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :questions do
    member do
      post    '/add_subcategories' => 'questions#add_subcategories'
      post    '/add_keywords' => 'questions#add_keywords'
      delete '/subcategories' => 'questions#delete_subcategories'
      delete '/keywords' => 'questions#delete_keywords'
    end
  end
  resources :keywords, only: [:index]
  resources :answers, only: [:create, :show]
  resources :validations, only: [:create]
  root 'static_pages#home'

  get ':id/alone' => 'static_pages#alone', as: :alone
  get '/apropos' => 'static_pages#apropos'
  get '/category' => 'static_pages#category'
  get '/faq' => 'static_pages#faq'
  get '/search' => 'static_pages#search'

  match '/404' => 'errors#error404', via: [:get, :post, :patch, :delete]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
