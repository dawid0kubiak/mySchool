Rails.application.routes.draw do
  get 'diary/view'

  post 'diary/addgrade'

  get 'diary/subjects'
  get 'diary/index'

  resources :teachers, only: :index
  resources :grades
  resources :subjects
  resources :pupils do
    get :subjects
    post :addsubjects
  end
  devise_for :users
  resources :users
  root 'pupils#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
