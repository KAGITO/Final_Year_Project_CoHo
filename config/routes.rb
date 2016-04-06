Rails.application.routes.draw do
  resources :documents
  resources :tags

  
  resources :questions do
    resources :answers
  end


  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :comments
  
  resources :links do
    member do
      put "like", to: "links#upvote"
      put "dislike", to: "links#downvote"
    end
     resources :comments
  end
  get 'links'  => 'links#index'


  get 'sessions/new'

  get 'auth/:provider/callback', to: "sessions#createthird"

 

  resources :users do
    member do
      get :following, :followers
    end
  end
  
  root 'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
   post 'signup' => 'users#create'

  get 'profile'   => 'static_pages#profile'

  get 'signup'  => 'users#new'
  get 'login'   => 'sessions#new'
  post 'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
end
