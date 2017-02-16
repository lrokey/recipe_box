Rails.application.routes.draw do
  
  get 'sources/edit'

  get 'sources/index'

  get 'sources/show'

  root "static_pages#home"

  get 'static_pages/home'

  get 'static_pages/about'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes

  resources :drinks

  resources :categories

  resources :reviews

  
end
