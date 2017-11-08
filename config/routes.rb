Rails.application.routes.draw do
  resources :drinks
  root 'application#hello'
end
