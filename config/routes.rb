LoLCritique::Application.routes.draw do
  authenticated :user do
    root :to => 'videos#index'
  end
  root :to => "videos#index"
  devise_for :users
  resources :users do
    resources :videos
  end
  resources :videos

  resources :users do
    resources :critiques
  end
  resources :critiques


  match '/g' => 'home#filter'
  match '/videos/:id/show' => 'videos#show'
  match '/critiques/:id/show' => 'critiques#show'
  match '' => 'videos#filter'
end
