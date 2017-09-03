Rails.application.routes.draw do
  get 'drink/index'

  devise_for :users
  root to: 'pages#home'

  resources :beers do
    resource :rating, only: :edit, module: :beers
  end

  get 'wines/autocomplete_appellation' => "wines#autocomplete_appellation"

  resources :wines do
    resource :rating, only: :edit, module: :wines
  end

  resources :drinks, only: :index

  mount Attachinary::Engine => "/attachinary"
end
