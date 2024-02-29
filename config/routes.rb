Rails.application.routes.draw do
  root 'pages#home'
  

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'signup' }
  get 'apply', to: 'pages#apply', as: 'apply'
  get 'start', to: 'pages#start', as: 'start'
  get 'logout', to: 'pages#logout', as: 'logout'

  resources :subscribe, only: [:index]
  resources :dashboard, only: [:index]
  resources :account, only: [:index, :update]
  resources :billing_portal, only: [:new, :create]
  resources :blog_posts, controller: :blog_posts, path: "blog", param: :slug

  # static pages
  pages = %w[
    privacy terms
  ]

  pages.each do |page|
    get "/#{page}", to: "pages##{page}", as: page.gsub('-', '_').to_s
  end

  namespace :admin do
    get '/', to: 'pages#dashboard'
  end
  
end
