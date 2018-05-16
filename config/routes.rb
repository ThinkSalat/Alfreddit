Rails.application.routes.draw do
  resources :users

  resource :session, only: [:new, :create, :destroy]
  
  resources :subs
  resources :posts do
    resources :comments, only:[:new]
  end
  
  resources :comments, only:[:create,:show]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
