Rails.application.routes.draw do
  post 'search', to: 'testers#search'
  root to: 'pages#home'
end
