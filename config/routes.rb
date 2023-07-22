Rails.application.routes.draw do
  
  root to: 'public/homes#top'

  # 顧客用
  devise_for :customers, skip:[:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  devise_for :admin, skip:[:passwords], controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }
  
  # 顧客用
  scope module: :public do
    resources :items do
      resource :favorites, only:[:create, :destroy]
    end
    
  end
  
  # 管理者
  namespace :admin do
	  resources :items 
	  resources :genres
	  resources :styles
  end
  
end
