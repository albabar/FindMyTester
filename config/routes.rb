Rails.application.routes.draw do
  get 'search', to: 'testers#search'
  root to: 'pages#home'
end
