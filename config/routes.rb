Rails.application.routes.draw do
  get 'diary/view'

  post 'diary/addgrade'

  get 'diary/subjects'
  get 'diary/index'

  resources :teachers, only: :index
  resources :grades
  resources :subjects
  resources :pupils do
    resources :subjects do
      resources :pupils_grade, only: [:index, :destroy]
    end
    get :subjects
    post :addsubjects
  end
  devise_for :users
  resources :users
  resources :messages
  root 'pupils#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
