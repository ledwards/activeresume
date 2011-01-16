Activeresume::Application.routes.draw do
  get "welcome/index"
  match 'dashboard' => 'dashboard#index', :as => 'dashboard' 
  
  devise_for :users, :controllers => { :registrations => "registrations" }
  match 'dashboard' => 'dashboard#index', :as => 'user_root'
  
  root :to => "welcome#index"
end
