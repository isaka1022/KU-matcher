Rails.application.routes.draw do
  # devise_for :users, only: []
  devise_for :companies, controllers: {
    sessions: 'companies/sessions',
    passwords: 'companies/passwords',
    registratinons: 'companies/registrations'
  }
  
  devise_for :students, controllers: {
    sessions: 'students/sessions',
    passwords: 'students/passwords',
    registratinons: 'students/registrations'
  }, :class_name => 'Student'
  resources :users, only: [:show, :edit, :update]
  resources :students, only: [:show, :edit, :update]
  resources :companies, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "top#index"
  mount ActionCable.server => '/cable'
end
