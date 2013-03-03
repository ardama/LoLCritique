LoLCritique::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users do
    resources :videos
  end
  resources :videos

  resources :users do
    resources :critiques
  end
  resources :critiques
  
  match '/videos/:id/show' => 'videos#show'
  match '/critiques/:id/show' => 'critiques#show'
end
