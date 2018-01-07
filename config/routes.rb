Rails.application.routes.draw do
  devise_for :users
  
  resources :restaurants, only: [:index, :show] do
  	resources :comments, only: [:create, :destroy]

    collection do
      # 瀏覽所有餐廳的最新動態
      # GET restaurants/feeds
      get :feeds

      # 十大人氣餐廳
      get :ranking
    end
    
    member do
      get :dashboard

      # 收藏 / 取消收藏
      post :favorite
      post :unfavorite

      # 喜歡 / 取消喜歡
      post :like
      post :unlike
    end
  end
  # 將 :index 加入開放項目
  resources :users, only: [:index, :show, :edit, :update]
  resources :followships, only: [:create, :destroy]

  resources :categories, only: :show
  root "restaurants#index"
  
  namespace :admin do
  	resources :restaurants
  	resources :categories
  	root "restaurants#index"
  end	

end

