Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'pages#home', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get 'drink/index'

  get 'beers/autocomplete_brewery' => "beers#autocomplete_brewery"

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
