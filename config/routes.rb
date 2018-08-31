Rails.application.routes.draw do
  root 'contacts#index'
  resources :contacts, except: :show
end
