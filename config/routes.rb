Rails.application.routes.draw do
  root 'home#index'

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#show'
  get '/followers', to: 'followers#show'
  get '/following', to: 'following#show'
end
