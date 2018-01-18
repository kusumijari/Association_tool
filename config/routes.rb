Rails.application.routes.draw do
  resources :matrices
  resources :association_types
  resources :drinks
  root 'application#hello'
  post 'associate_drink' => 'drinks#associate'
  post 'save_entry' => 'matrices#save_entry'
  get 'completed' => 'matrices#completed'
  get 'matrices/:name/matrix_entry' => 'matrices#matrix_entry' 
  post 'matrices/remove_things' => 'matrices#remove_things'
  get 'matrices/home' => 'matrices#home', :as =>	'home'
end

