Rails.application.routes.draw do
  resources :matrices
  resources :association_types
  resources :drinks
  root 'application#hello'
end
