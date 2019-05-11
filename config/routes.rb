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
  }
  
  resources :students, only: [:index, :show, :edit, :update]
  resources :companies, only: [:show, :edit, :update]
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  resources :scrooms, only: [:index, :show, :create] 
  resources :scmessages, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "top#index"
end
