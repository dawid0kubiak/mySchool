Rails.application.routes.draw do
  resources :grades
  resources :subjects
  resources :pupils
  devise_for :users
  root "pupils#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
