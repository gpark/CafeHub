Rails.application.routes.draw do
  root to: 'static_pages#root'

  resources :facilities
  resources :assignments
  resources :assignments_weeks
  resources :subs

  namespace :api, defaults: {format: :json} do
    get 'preference/view' => 'preference#view'
    post 'preference/change' => 'preference#change'
  end

  devise_for :users, controllers: {
    sessions: 'api/sessions',
    registrations: 'api/registrations'
  }

  devise_scope :user do
    post '/users/token_login', to: 'api/sessions#token_login'
  end

  # routes to refactor
  # devise_for :users
  # get 'dashboard/home'
  #
  # get '/settings' => 'settings#index'
  # patch '/settings' => 'settings#update'
  #
  # get '/users/all' => 'users#all'
  # post '/users/privileges' => 'users#privileges'
  #
  # patch '/subs/take' => 'subs#update'
  #
  # get '/user/:id/assignments' => 'users#assignments'

  get '*path', to: 'static_pages#root'
end
