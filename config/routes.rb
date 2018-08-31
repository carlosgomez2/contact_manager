Rails.application.routes.draw do

  root 'contacts#index'
  get  'contacts/index', as: 'contacts'
  get  'contacts/new', as: 'new_contact'
  post 'contacts/create', as: 'create_contact'
  get  'contact/:id/edit', to: 'contacts#edit', as: 'edit_contact'
  patch 'contacts/:id/update', to: 'contacts#update', as: 'update_contact'

end