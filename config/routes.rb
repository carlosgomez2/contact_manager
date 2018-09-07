Rails.application.routes.draw do
  root 'contacts#index'
  resources :contacts, except: :show do
    get 'autocomplete', on: :collection
  end

  post 'groups', to: 'groups#create'

end
