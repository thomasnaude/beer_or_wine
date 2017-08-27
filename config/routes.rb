Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :beers do
    resource :rating, only: :edit, module: :beers
  end

  mount Attachinary::Engine => "/attachinary"
end
