Rails.application.routes.draw do
 
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  root            'static_pages#home'
  get 'about' =>  'static_pages#about' 
  get 'plan' => 	'articles#plan'
  get 'cities' =>	'static_pages#cities'

  resources :articles do
  	resources :attachments
  end

  get 'tags/:tag', to: 'articles#index', as: :tag
  
end
