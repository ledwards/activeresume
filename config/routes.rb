Activeresume::Application.routes.draw do
  get "welcome/index"
  match 'dashboard' => 'dashboard#index', :as => 'dashboard' 
  
  devise_for :users, :controllers => { :registrations => "registrations" }
  match 'dashboard' => 'dashboard#index', :as => 'user_root'
  
  resources :employments
  resources :educations
  resource :profile
  resources :projects
  resources :publications
  
  root :to => "welcome#index"
end
