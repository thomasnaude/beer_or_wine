Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :beers do
    resource :rating, only: :edit, module: :beers
  end

  resources :wines do
    resource :rating, only: :edit, module: :wines
  end

  mount Attachinary::Engine => "/attachinary"
end
