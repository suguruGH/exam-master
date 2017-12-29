Rails.application.routes.draw do
  get 'sessions/new'

#   get 'blogs/index' 
    root :to => 'blogs#index'

    resources :blogs do
        collection do
            post :confirm
        end
    end
      resources :users
      resources :sessions, only: [:new, :create, :destroy]
      resources :favorites, only: [:create, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
