Rails.application.routes.draw do
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

 

  resources :users do
    member do
      get :following, :followers
    end
  end
  
  root 'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'signup'  => 'users#new'
  get 'login'   => 'sessions#new'
  post 'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
end
