Rails.application.routes.draw do
  root 'notes#index'

  resources :notes, only: [:index, :new, :create, :edit, :update]
end
