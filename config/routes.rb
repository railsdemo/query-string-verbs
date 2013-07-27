QueryStringVerbs::Application.routes.draw do
  get "users/list"
  get "users/view"
  
  resources :locations, only: [:index, :show]
  
  get 'locations?v=new',            to: 'locations#index',  as: 'new_location'
  post 'locations(?v=create)',      to: 'locations#index'

  scope 'locations' do 
    get     ':id?v=edit',           to: 'locations#show',   as: 'edit_location'
    put     ':id(?v=update)',       to: 'locations#show'
    patch   ':id(?v=update)',       to: 'locations#show'
    delete  ':id(?v=destroy)',      to: 'locations#show'
  end

end
