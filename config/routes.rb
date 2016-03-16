Rails.application.routes.draw do
  root 'welcome#index'
  post '/' => 'welcome#show'
  get '/about' => 'welcome#about'

  get "/auth/:provider/callback", to: "sessions#create"
  delete "/logout", to: 'sessions#destroy', as: :logout

end
