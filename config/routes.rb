Rails.application.routes.draw do
  resources :pupils do
    resources :subjects
  end
  devise_for :users
  root "pupils#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
