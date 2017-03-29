Rails.application.routes.draw do
  root to: 'static_pages#root'

  resources :facilities
  resources :assignments
  resources :assignments_weeks
  resources :subs

  namespace :api, defaults: {format: :json} do
    resource :preference, only: [:new, :edit] do
      get 'view'
      post 'change' => 'preference#change'
    end

    scope :auth do
      get 'is_signed_in', to: 'auth#is_signed_in'
    end
  end


  devise_for :users
  get 'dashboard/home'

  get '/settings' => 'settings#index'
  patch '/settings' => 'settings#update'

  get '/users/all' => 'users#all'
  post '/users/privileges' => 'users#privileges'

  patch '/subs/take' => 'subs#update'

  get '/user/:id/assignments' => 'users#assignments'
end
