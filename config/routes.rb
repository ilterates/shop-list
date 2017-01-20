Rails.application.routes.draw do
  root 'application#home'

  get 'list', to: 'list#index', as:'lists'
  post 'list', to: 'list#create'

  ### edit ###
  get 'list/:id', to: 'list#index', as: 'item'
  get 'list/:id/edit', to: 'list#index', as: 'edit_item'
  patch 'list/:id', to: 'list#update'

  ### Delete ###
  delete 'list', to: 'list#destroy', as:'kill'

end
