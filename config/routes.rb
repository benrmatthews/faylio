Faylio::Application.routes.draw do
  resources :activities

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions,      only: [:new, :create, :destroy]
  
  resources :fails do
      resources :comments
      member { post :vote }
  end
  resources :relationships, only: [:create, :destroy]
  
  get "users/new"
  
  root :to => 'static_pages#home'
  
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
    
  match '/home',        to: 'static_pages#home',        via: 'get'
  match '/help',        to: 'static_pages#help',        via: 'get'
  match '/about',       to: 'static_pages#about',       via: 'get'
  match '/contact',     to: 'static_pages#contact',     via: 'get'
  match '/manifesto',   to: 'static_pages#manifesto',   via: 'get'
  match '/faqs',        to: 'static_pages#faqs',        via: 'get'
  match '/support',     to: 'static_pages#support',     via: 'get'
  match '/terms',       to: 'static_pages#terms',       via: 'get'
  match '/privacy',     to: 'static_pages#privacy',     via: 'get'
  match '/security',    to: 'static_pages#security',    via: 'get'
  
end
