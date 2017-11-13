Rails.application.routes.draw do
  resources :matrices
  resources :association_types
  resources :drinks
  root 'application#hello'
  post 'associate_drink' => 'drinks#associate'
  post 'test' => 'matrices#test'
  get 'completed' => 'matrices#completed'
  get 'matrices/:name/matrix_entry' => 'matrices#matrix_entry' 
  get 'matrices/home' => 'matrices#home', :as =>	'home'
end

