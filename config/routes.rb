Rails.application.routes.draw do
 
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  root            'static_pages#home'
  get 'about' =>  'static_pages#about' 

  resources :articles
  get 'tags/:tag', to: 'articles#index', as: :tag
  
end
