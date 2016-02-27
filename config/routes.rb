Rails.application.routes.draw do
  resources :questions
 resources :microposts,          only: [:create, :destroy]



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

 

  resources :users
  root 'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'signup'  => 'users#new'
  get 'login'   => 'sessions#new'
  post 'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
end
