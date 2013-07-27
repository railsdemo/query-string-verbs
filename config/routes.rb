QueryStringVerbs::Application.routes.draw do
  
  root to: "pages#home"
  # Locations - modifying scaffolding
  resources :locations, only: [:index, :show]
  
  get      'locations?v=new',       to: 'locations#index',  as: 'new_location'
  post     'locations(?v=create)',  to: 'locations#index'

  scope 'locations' do 
    get     ':id?v=edit',           to: 'locations#show',   as: 'edit_location'
    put     ':id(?v=update)',       to: 'locations#show'
    patch   ':id(?v=update)',       to: 'locations#show'
    delete  ':id(?v=destroy)',      to: 'locations#show'
  end

  # Users - built from scratch, using same verbs as scaffolding, but different actions
  get     'users',                  to: 'users#list',        as: 'users'
  get     'users?v=new',            to: 'users#list',        as: 'new_user'
  post    'users(?v=create)',         to: 'users#list'
  
  scope 'users' do  
    get     ':id',                  to: 'users#view',        as: 'user'
    get     ':id?v=edit',           to: 'users#view',        as: 'edit_user'
    put     ':id(?v=update)',       to: 'users#view'
    patch   ':id(?v=update)',       to: 'users#view'
    delete  ':id(?v=destroy)',      to: 'users#view'
  end

end
