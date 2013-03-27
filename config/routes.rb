DrPicasa::Application.routes.draw do
  root :to => 'sessions#new'
  match '/callback' => 'sessions#callback'

  match '/albums' => 'albums#index', as: 'albums'
  match '/album/:id' => 'albums#show', as: 'album'
  match '/comment/create' => 'comments#create', as: 'comment'
end
