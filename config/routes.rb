Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks" , registrations: 'registrations'}
  resources :users , only: [:index, :show] do
    resources :messages do
      resources :responses
    end
  end

  resources :charges
  resources :searches

  get 'auth/:provider/callback', to: 'sessions#create'
  root 'home#index'
  get '/about', to: 'home#about'
  post '/messages/reply', to: 'responses#create', as: :reply_message

end
