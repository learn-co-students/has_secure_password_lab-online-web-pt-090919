Rails.application.routes.draw do
  root 'welcome#home'
  post 'login' => 'sessions#create'
  get 'login' => 'sessions#new'
  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
