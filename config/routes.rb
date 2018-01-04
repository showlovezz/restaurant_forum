Rails.application.routes.draw do
  devise_for :users
  
  resources :restaurants, only: [:index, :show] do
  	resources :comments, only: [:create, :destroy]

    collection do
      get :feeds
    end
    
    member do
      get :dashboard

      # 收藏 / 取消收藏
      post :favorite
      post :unfavorite
    end
  end	
  resources :users, only: [:show, :edit, :update]
  resources :categories, only: :show
  root "restaurants#index"
  
  namespace :admin do
  	resources :restaurants
  	resources :categories
  	root "restaurants#index"
  end	

end

