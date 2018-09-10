Rails.application.routes.draw do
  get 'dashboard/index'

  get 'home/index'

  devise_for :users
  
  root 'home#index'
  
  resources :contacts, except: :show do
    get 'autocomplete', on: :collection
  end

  post 'groups', to: 'groups#create'
  get '/dashboard', to: 'dashboard#index'

end
