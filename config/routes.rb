Rails.application.routes.draw do
  root 'pages#home'
  get 'apply', to: 'pages#apply' # new user application form
  get 'thanks', to: 'pages#thanks', as: 'thanks'
  get 'start', to: 'pages#start', as: 'start' # new user onboarding
  get 'magic_login', to: 'pages#magic_login', as: 'magic_login'

  devise_for :users
  get 'logout', to: 'pages#logout', as: 'logout'


  resources :subscribe, only: [:index]
  # resources :dashboard, only: [:index]
  get 'dashboard', to: 'dashboard#index', as: :dashboard_index

  
  resources :stakeholder_updates, only: [:new, :create, :show]

  resources :account, only: [:index, :update]
  resources :billing_portal, only: [:create]
  resources :user_submissions, only: [:create]
  resources :projects, only: [:update]
  resources :subscribers

  delete '/subscribers', to: 'subscribers#destroy'

  match '/billing_portal' => 'billing_portal#create', via: [:get]
  match '/cancel' => 'billing_portal#destroy', via: [:get]

  # static pages
  pages = %w(
    privacy terms
  )

  pages.each do |page|
    get "/#{page}", to: "pages##{page}", as: "#{page.gsub('-', '_')}"
  end

  namespace :admin do
    get '/', to: 'pages#dashboard'
    resources :user_submissions, only: [:update]
  end

  # admin panels
  # authenticated :user, -> user { user.admin? } do
  #   namespace :admin do
  #     resources :dashboard, only: [:index]
  #     resources :impersonations, only: [:new]
  #     resources :users, only: [:edit, :update, :destroy]
  #   end
  #
  #   # convenience helper
  #   get 'admin', to: 'admin/dashboard#index'
  # end
end